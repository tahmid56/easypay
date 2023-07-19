import 'package:dio/dio.dart';
import 'package:easypay/Services/auth_services.dart';
import 'package:easypay/common/utils/error_handling.dart';
import 'package:easypay/models/firstRegistration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/auth_provider.dart';
import '../route/named_routes.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
    (ref) => AuthController(authServices: ref.watch(authServicesProvider)));

class AuthController extends StateNotifier<bool> {
  final AuthServices _authServices;
  AuthController({required AuthServices authServices})
      : _authServices = authServices,
        super(false);

  void firstStepRegistration(
      {required BuildContext context,
      required String fullName,
      required String mobileNumber}) async {
    state = true;
    final Response? res = await _authServices.firstRegistration(
        context: context, fullName: fullName, mobileNumber: mobileNumber);
    state = false;
    // ignore: use_build_context_synchronously
    httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          debugPrint("Api success");
          var data = FirstRegistrationModel.fromJson(res?.data);
          FirstStepProvider().saveFirstStepData(data.data);
          GoRouter.of(context).pushNamed(NamedRoutes.registration2);
        });
  }
}
