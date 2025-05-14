import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../widgets/user_tile.dart';

// The user list screen (only UI with sample data for now)
class UserScreen extends StatelessWidget {
  // Sample hardcoded users to display
  final List<User> sampleUsers = [
    User(id: 1, name: 'Alice Smith', email: 'alice@example.com', phone: '123-456-7890'),
    User(id: 2, name: 'Bob Johnson', email: 'bob@example.com', phone: '987-654-3210'),
    User(id: 3, name: 'Charlie Brown', email: 'charlie@example.com', phone: '555-666-7777'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User List')),
      body: ListView.builder(
        itemCount: sampleUsers.length,
        itemBuilder: (context, index) {
          return UserTile(user: sampleUsers[index]);
        },
      ),
    );
  }
}
