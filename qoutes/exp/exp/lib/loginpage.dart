import 'package:exp/Home.dart';
import 'package:exp/bloc/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Define variables to store user input

  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  LoginBloc _bloc = LoginBloc();
  bool isLoading = false;

  login() async {
    _bloc.add(LoginEvent(
        username: _usernamecontroller.text,
        password: _passwordcontroller.text));
  }

  // Create a GlobalKey to identify the form for validation

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      bloc: _bloc,
      listener: (context, state) {
        // TODO: implement listener
        if (state is LoginSuccessState) {
          isLoading = false;
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } else if (state is LoginErrorState) {
          isLoading = false;
          Text("state.error");
        } else if (state is LoginLoadingState) {
          isLoading = true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: BlocBuilder<LoginBloc, LoginState>(
              bloc: _bloc,
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Email Input
                    BlocProvider(
                      create: (context) => LoginBloc(),
                      child: TextFormField(
                        controller: _usernamecontroller,
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        
                      ),
                    ),
                    SizedBox(height: 16.0),

                    // Password Input
                    TextFormField(
                      controller: _passwordcontroller,
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      
                    ),
                    SizedBox(height: 32.0),

                    // Login Button
                    BlocProvider(
                      create: (context) => LoginBloc(),
                      child: ElevatedButton(
                        onPressed: () {
                          login();
                        },
                        child: isLoading?Center(
                          child: CircularProgressIndicator(),
                        )
                        :Text("Login")
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
