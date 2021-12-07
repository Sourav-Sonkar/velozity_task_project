part of 'restaurant_list_cubit.dart';

class RestaurantListState extends Equatable {
  final String errMsg;
  final bool isLoading;
  final bool isLoadingNext;
  final List<Result>? restaurntList;
  const RestaurantListState(
      {this.restaurntList,
      this.errMsg = "",
      this.isLoading = false,
      this.isLoadingNext = false});

  @override
  List<Object> get props => [errMsg, isLoading, isLoadingNext, restaurntList ?? []];
  
  RestaurantListState copyWith({
    List<Result>? restaurntList,
    String? errMsg,
    bool? isLoading,
    bool? isLoadingNext,
  }) {
    return RestaurantListState(
      restaurntList: restaurntList ?? this.restaurntList,
      errMsg: errMsg ?? this.errMsg,
      isLoading: isLoading ?? this.isLoading,
      isLoadingNext: isLoadingNext ?? this.isLoadingNext,
    );
  }
}
