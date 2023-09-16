part of 'login_bloc.dart';

@immutable
abstract class UserEvent extends Equatable{
  const UserEvent();

}


class InitLogin extends UserEvent {
  String toString() => 'InitLogin';

  @override

  List<Object> get props => [];

}


class LoginEvent extends UserEvent{
  final String username;
  final String password;

  LoginEvent({required this.username, required this.password});
   @override
  List<Object> get props => [username,password];
  String toString() => 'LoginEvent { username: $username, password: $password }';
}
  





