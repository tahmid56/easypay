import 'package:easypay/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider = StateNotifierProvider<UserRepository, User?>((ref) => UserRepository());

class UserRepository extends StateNotifier<User?> {
  UserRepository() : super(null);

  void saveUser(User user) {
    state = user;
  }

  String getUserName() {
    return state?.data.fullName ?? "";
  }

}
