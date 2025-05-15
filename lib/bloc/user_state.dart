import '../models/user_model.dart';

// Abstract base class for user states
abstract class UserState {}

// Initial (idle) state
class UserInitial extends UserState {}

// Loading state while fetching data
class UserLoading extends UserState {}

// Loaded state with user data
class UserLoaded extends UserState {
  final List<User> users;
  UserLoaded(this.users);
}

// Error state if something goes wrong
class UserError extends UserState {
  final String message;
  UserError(this.message);
}
