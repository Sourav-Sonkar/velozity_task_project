import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velozity_project/network/models/request_status.dart';
import 'package:velozity_project/network/models/restaurant_list.dart';
import 'package:velozity_project/network/network_connection.dart';

part 'restaurant_list_state.dart';

class RestaurantListCubit extends Cubit<RestaurantListState> {
  final NetworkConnection networkConnection;
  int fromCount = 0;
  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token") ?? "";
  }

  RestaurantListCubit(this.networkConnection)
      : super(const RestaurantListState());

  void getRestaurants() async {
    emit(state.copyWith(isLoading: true));
    try {
      if ((await getToken()).isNotEmpty) {
        networkConnection
            .getRestaurants((await getToken()), fromCount)
            .then((value) {
          if (value.status == RequestStatus.SUCCESS) {
            emit(state.copyWith(
              restaurntList: value.body?.result ?? [],
              isLoading: false,
            ));
          } else {
            emit(state.copyWith(
              isLoading: false,
              errMsg: value.message ?? "Something went wrong",
            ));
          }
        });
      } else {
        emit(state.copyWith(
          isLoading: false,
          errMsg: "Invalid Token",
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errMsg: "Something went wrong",
      ));
    }
  }

  void getMoreRestaurants() async {
    var currentState = state;
    if (currentState.isLoading||currentState.isLoadingNext) return;
    emit(state.copyWith(isLoadingNext: true));
    try {
      if ((await getToken()).isNotEmpty) {
        fromCount += 5;
        networkConnection
            .getRestaurants((await getToken()), fromCount)
            .then((value) {
          if (value.status == RequestStatus.SUCCESS) {
            currentState.restaurntList!.addAll(value.body?.result ?? []);
            emit(state.copyWith(
              restaurntList: currentState.restaurntList,
              isLoadingNext: false,
            ));
          } else {
            emit(state.copyWith(
              isLoadingNext: false,
              errMsg: value.message ?? "Something went wrong",
            ));
          }
        });
      } else {
        emit(state.copyWith(
          isLoadingNext: false,
          errMsg: "Invalid Token",
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isLoadingNext: false,
        errMsg: "Something went wrong",
      ));
    }
  }
}
