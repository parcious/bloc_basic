part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}
class LogInLoadingState extends LoginState {}
class LogInSuccessState extends LoginState {
  // final List<LogInModel> loginModel;
  const LogInSuccessState();
    @override
  List<Object> get props => [];
}
class LogInErrorState extends LoginState {

  final String error;

  LogInErrorState(this.error);

}


