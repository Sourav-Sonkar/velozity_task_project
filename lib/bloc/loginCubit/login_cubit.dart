import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velozity_project/network/models/request_status.dart';
import 'package:velozity_project/network/network_connection.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final NetworkConnection networkConnection;
  LoginCubit(this.networkConnection) : super(const LoginState());

  void login(String phone, String password) async {
    emit(state.copyWith(isLoading: true));
    try {
      await networkConnection.login(phone, password).then((value) async {
        if (value.status == RequestStatus.SUCCESS) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', value.body?.authToken ?? "");
          await prefs.setBool("isLoggedIn", true);
          emit(state.copyWith(isLoading: false, isSuccess: true));
        } else {
          emit(state.copyWith(
              isLoading: false, isSuccess: false, errMsg: value.message));
        }
      });
    } catch (e) {
      emit(state.copyWith(isLoading: false, errMsg: "Something went wrong"));
    }
  }
}
