import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      try {
        emit(AuthAuthenticating());
        var result = await loginCall(event.Username, event.Password);
        if (result != null && result != "") {
          emit(AuthAuthenticated());
          print("Succesfull");
        } else {
          //emit(AuthUnAuthenticated(Error: 'Invalid Username or Password'));
          print("Invalid Username or Password");
        }
      } catch (e) {
        emit(AuthUnAuthenticated(Error: toString()));
      }
    });
  }
  Future loginCall(email, password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      print('api call');

      var response = await http.post(Uri.parse("https://reqres.in/api/login"),
          body: ({'email': email, 'password': password}));
     // print("recived");
      if (response.statusCode == 200) {
        print("recived");
        return response.body;
      } else {
        emit(AuthUnAuthenticated(Error: 'Api Call failed'));
      }
    }
  }
}
