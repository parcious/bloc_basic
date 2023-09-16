import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import'home_page.dart';
import 'bloc/login_bloc.dart';
import 'home_page.dart';


class LogInPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginBloc _bloc = LoginBloc();
  bool isLoading= false;

  login() async {
    _bloc.add(LogInEvent(
      username: usernameController.text,
      password: passwordController.text,
    ));
  }

  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      bloc: _bloc,
         
      listener: (context, state) {
        // TODO: implement listener
        if (state is LogInSuccessState) {
          isLoading = false;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
                  
                  
            }
            else if (state is LogInErrorState){
              isLoading = false;
             Text(state.error,
          style: TextStyle(
            color:Colors.red),
            );
           }
           else if (state is LogInLoadingState) {
               isLoading = true;
              }
          
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Container(
              child: BlocBuilder<LoginBloc, LoginState>(
                bloc: _bloc,
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.all(8.0)),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 20),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 5, top: 30),
                              child: Text(
                                "Email Address ",
                                style:
                                    TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.grey),
                              )),
                        ],
                      ),
                      BlocProvider(
                        create: (context) => LoginBloc(),
                        child: TextField(
                            controller: usernameController,
                            decoration: InputDecoration(
          
                                // icon: Icon(Icons.person),
          
                                )),
                      ),
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 5, top: 30),
                              child: Text(
                                "Password ",
                                style:
                                    TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.grey),
                              )),
                        ],
                      ),
                       TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                // icon: Icon(Icons.security),
                                )),
                      
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 210 ,right:10),
                            child:  TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 2,
                                    ),
                                  )),
                            
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        child: BlocProvider(
                          create: (context) => LoginBloc(),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 58, 147, 104),
                                minimumSize: const Size.fromHeight(50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                login();
                           
                              },
                              child: isLoading ?  
                                  Center(
                                    child: CircularProgressIndicator(color: Colors.white,),
                                  )
                                  : Text(
                                'LogIn',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ))),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(children: [
                        Expanded(
                          child: new Container(
                              margin:
                                  const EdgeInsets.only(left: 10.0, right: 20.0),
                              child: Divider(
                                color: Colors.grey,
                                height: 36,
                              )),
                        ),
                        Text("Or login with",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            )),
                        Expanded(
                          child: new Container(
                              margin:
                                  const EdgeInsets.only(left: 20.0, right: 10.0),
                              child: Divider(
                                color: Colors.grey,
                                height: 36,
                              )),
                        ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: Row(
                          children: [
                            SizedBox(width: 50),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(
                                "assets/facebookicon.png",
                              ),
                              fit: BoxFit.fill,
                              ),
                                  borderRadius: BorderRadius.circular(5)
                                  //more than 50% of width makes circle
                                  ),
                            ),
          
                            SizedBox(width: 40),
          
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(
                                "assets/instagramicon.jpg",
                              ),
                              fit: BoxFit.fill,
                              ),
                                  borderRadius: BorderRadius.circular(5)
                                  //more than 50% of width makes circle
                                  ),
                            ),
          
                            SizedBox(width: 40),
          
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(
                                "assets/twittericon2.png",
                              ),
                              fit: BoxFit.fill,
                              ),
                                  borderRadius: BorderRadius.circular(5)
                                  //more than 50% of width makes circle
                                  ),
                              
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Center(
                              child: Container(
                               //color: Colors.grey,
                               //height: 40,
                                margin: EdgeInsets.only(left: 30),
                                child: Text("Don't have an account?"),
                              ),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text("Register",
                                    style: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 58, 147, 104),
                                    )))
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
