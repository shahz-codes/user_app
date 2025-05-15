import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/user_repository.dart';
import 'user_event.dart';
import 'user_state.dart';

// BLoC that handles user-related logic
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;

  // Initial state is UserInitial
  UserBloc(this.repository) : super(UserInitial()) {
    // Register event handler
    on<LoadUsers>((event, emit) async {
      emit(UserLoading()); // show loading

      try {
        final users = await repository.fetchUsers(); // fetch from repo(API)
        emit(UserLoaded(users)); // emit loaded user
      } catch (e) {
        emit(UserError('Failed to load users')); // error
      }
    });
  }
}
