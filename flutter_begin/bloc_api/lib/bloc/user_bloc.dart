import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/bloc/user_event.dart';
import 'package:my_project/bloc/user_state.dart';
import '../repo/repositories.dart';
//import 'repo/repositories.dart';



class UserBloc extends Bloc<UserEvent,UserState>{
  final UserRepository _userRepository;

  UserBloc(this._userRepository):super(UserLoadingState()){
    on<LoadUserEvent>((event,emit) async{
      emit(UserLoadingState());
      print("loading state called");
       
       try{
        print("loaded state calling");
      
         final users=await _userRepository.getUsers();
         print("loaded api called");
      
         emit(UserLoadedState(users));
         print("loaded state called");
      

       }catch(e){
        emit(UserErrorState(e.toString()));

       }

    });
  }

}