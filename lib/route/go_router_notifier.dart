import 'package:flutter_riverpod/flutter_riverpod.dart';

final loggedInProvider =
    Provider<LoggedInNotifier>((ref) => LoggedInNotifier());

class LoggedInNotifier extends StateNotifier<bool> {
  LoggedInNotifier() : super(false);

  void isLoggedIn(bool value) {
    state = value;
  }

  bool getLoggedInStatus() {
    return state;
  }
}
