import 'package:flutter/material.dart';
import 'login_page.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BlocDemo());
}
class BlocDemo extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
   primarySwatch: Colors.blue,

   ),
   
      home: LogInPage(),
    );
  }
}