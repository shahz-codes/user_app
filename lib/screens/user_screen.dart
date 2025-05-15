import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc.dart';
import '../bloc/user_event.dart';
import '../bloc/user_state.dart';
import '../widgets/user_tile.dart';
import '../models/user_model.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User List')),

      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            // Show loading spinner while data being fetched
            return Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
            final users = state.users;
            // Once loaded then shows a scrollable list of users

            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return UserTile(user: users[index]);
              },
            );
          } else if (state is UserError) {
            // If an error occurs then it will show error_message
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('Press the button to fetch users'));
          }
        },
      ),
    );
  }
}
