import 'dart:convert';
import 'package:http/http.dart'as http;
import 'dart:convert';
import '../model/user_model.dart';

 class UserRepository{
  Future getUsers()async{
    var response= await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    if(response.statusCode==200){
      //print(response.body);
      final List result=jsonDecode(response.body)['data']; 
      return result.map(((e) => User.body);
    }else{
      throw Exception(response.reasonPhrase);
    }
  }
 }