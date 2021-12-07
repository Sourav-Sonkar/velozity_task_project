part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String errMsg;
  final bool isLoading;
  final bool isSuccess;
  const LoginState(
      {this.errMsg = "", this.isLoading = false, this.isSuccess = false});
  @override
  List<Object> get props => [errMsg, isLoading, isSuccess];

  LoginState copyWith({String? errMsg, bool? isLoading, bool? isSuccess}) {
    return LoginState(
      errMsg: errMsg ?? this.errMsg,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  bool get stringify => true;
}
