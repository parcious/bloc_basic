import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/auth_bloc.dart';
import 'package:flutter_application_1/bloc/bloc/user_bloc.dart';
import 'package:flutter_application_1/bloc/bloc/user_event.dart';
import 'package:flutter_application_1/bloc/bloc/user_state.dart';
import 'package:flutter_application_1/model/user_model.dart';
import 'package:flutter_application_1/repo/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UserBloc(UserRepository()),
        child: Scaffold(
          appBar: AppBar(
            title: Text('User List'),
          ),
          body: providers(),
              
        ));
  }

  Widget providers() {
    return BlocProvider(
        create: (context) => UserBloc(
              UserRepository(),
            )..add(LoadUserEvent()),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UserLoadedState) {
              List<Datum> userList = state.users.data;
              return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  final user = userList[index];
                  return ListTile(
                    title: Text(
                      '${userList[index].firstName} ${userList[index].lastName}',
                    ),
                    subtitle: Text(
                      '${userList[index].email}',
                    ),
                  );
                },
              );
            } else if (state is UserErrorState) {
              return Center(
                child: Text('Error: ${state.error}'),
              );
            } else {
              return Center(
                child: Text('Press the button to load users.'),
              );
            }
          },
        ));
  }
}
