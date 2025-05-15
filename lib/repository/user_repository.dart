import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

// Repository that handles data fetching logic
class UserRepository {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/users';

  // Fetch user list from API and convert to List<User>
  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // convert JSON data and User model by extracting its field
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      // Handle error- API fail
      throw Exception('Failed to load users');
    }
  }
}
