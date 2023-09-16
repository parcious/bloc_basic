part of 'auth_bloc.dart';

abstract class AuthState extends Equatable{
  const AuthState();
   @override
  List<Object> get props => [];
}

 class AuthInitial extends AuthState {
 }


class AuthAuthenticating extends AuthState{


}
class AuthAuthenticated extends AuthState{
   const AuthAuthenticated();
    @override
  List<Object> get props => [];

}
class AuthUnAuthenticated extends AuthState{
   final String Error;

  AuthUnAuthenticated({required this.Error});
   

}




