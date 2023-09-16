part of 'login_bloc.dart';

 abstract class UserEvent extends Equatable{
  const UserEvent();
}

class LogInEvent extends UserEvent {
 // const LogInEvent();
  final String username;

  final String password;

   LogInEvent({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [username,password];
  String toString() => 'LogInEvent { username: $username, password: $password }';
}


class InitLogin extends UserEvent {
  String toString() => 'InitLogin';

  @override

  List<Object> get props => [];

}

