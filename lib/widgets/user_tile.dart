import 'package:flutter/material.dart';
import '../models/user_model.dart';

// Widget to display a user's avatar, name, email, and phone
class UserTile extends StatelessWidget {
  final User user;

  const UserTile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(user.name[0]),
      ),
      title: Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(user.email),
          Text(user.phone),
        ],
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }
}
