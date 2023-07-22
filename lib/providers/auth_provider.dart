import 'package:easypay/models/firstRegistration.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirstStepProvider extends StateNotifier<Data?> {
  FirstStepProvider() : super(null);

  void saveFirstStepData(Data data) {
    state = data;
  }

  String getFirstRegistrationData() {
    return state?.fullName ?? "";
  }

  void removeFirstStepData() {
    state = null;
  }
}
