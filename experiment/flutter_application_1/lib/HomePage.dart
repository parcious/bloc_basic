import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/Second_page.dart';
import 'package:flutter_application_1/bloc/auth_bloc.dart';
import 'package:flutter_application_1/bloc/bloc/user_bloc.dart';
import 'package:flutter_application_1/repo/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  UserBloc bloc = UserBloc(UserRepository());

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Bloc Page"),
        ),
        body: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              // TODO: implement listener
              if (state is AuthAuthenticated) {
                Future.delayed(Duration.zero, () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                });
              }
            },
            child: Container(
              child: Column(
                children: [
                  TextFormField(
                    controller: username,
                    decoration: InputDecoration(labelText: "UserName"),
                  ),
                  TextFormField(
                    controller: password,
                    decoration: InputDecoration(labelText: "Password"),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        authBloc.add(
                          LoginEvent(
                              Username: username.text, Password: password.text),
                        );
                      },
                      child: Text("LOgin"))
                ],
              ),
            )));
  }
}
