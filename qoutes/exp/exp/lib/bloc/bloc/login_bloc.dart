import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<UserEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      // TODO: implement event handler
      try{
        emit (LoginLoadingState());
        var result =await loginCall(event.username,event.password);
        if(result !=null&& result!=""){
        print("Successfll");
        emit(LoginSuccessState());}
        else{
          print("UserName or password is incorrect");
        }


      }catch(e){
        emit(LoginErrorState("Failed to LOgin"));
        print(("error $e"));
      }
    });
  }
  Future loginCall(email, password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      print('api call');

      var response = await http.post(Uri.parse("https://reqres.in/api/login"),
          body: ({'email': email, 'password': password}));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        emit(LoginErrorState("Failed to login "));
      }
    }
  }
}
