import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc.dart';
import '../bloc/user_event.dart';
import '../bloc/user_state.dart';
import '../widgets/user_tile.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'), // Title
        actions: [
          IconButton(
            icon: Icon(Icons.refresh), // Refresh icon
            onPressed: () {
              // When the refresh icon is tapped, trigger the LoadUsers event
              context.read<UserBloc>().add(LoadUsers());
            },
          )
        ],
      ),

      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          // loading spinner when app fetch's data
          if (state is UserLoading) {
            return Center(child: CircularProgressIndicator());
          }

          // data is successfully loaded, display in scrollable list
          else if (state is UserLoaded) {
            final users = state.users; // Extract list of users from the state
            return ListView.builder(
              itemCount: users.length, // Total number of users
              itemBuilder: (context, index) {
                // UserTile widget to display each user's data
                return UserTile(user: users[index]);
              },
            );
          }

          // error block
          else if (state is UserError) {
            return Center(child: Text(state.message)); // Show error
          }

          // Default fallback
          else {
            return Center(child: Text('Press the refresh button to fetch users'));
          }
        },
      ),
    );
  }
}