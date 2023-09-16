part of 'auth_bloc.dart';


abstract class AuthEvent extends Equatable{
  const AuthEvent();
   @override
  List<Object?> get props => [];
}

class LoginEvent extends AuthEvent{
  final String Username;
  final String Password;


  LoginEvent({required this.Username, required this.Password});
   @override
  List<Object> get props => [Username,Password];
  String toString() => 'LoginEvent { Username: $Username, Password: $Password }';
  }
 