import 'package:dio/dio.dart';
import 'package:easypay/Services/auth_services.dart';
import 'package:easypay/common/utils/error_handling.dart';
import 'package:easypay/models/firstRegistration.dart';
import 'package:easypay/models/user.dart';
import 'package:easypay/providers/user_provider.dart';
import 'package:easypay/route/go_router_notifier.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      required String mobileNumber,
      required String password,
      required DateTime dateTime}) async {
    state = true;
    final Response? res = await _authServices.firstRegistration(
      context: context,
      fullName: fullName,
      mobileNumber: mobileNumber,
      password: password,
      dateTime: dateTime,
    );
    state = false;
    // ignore: use_build_context_synchronously
    httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          var data = FirstRegistrationModel.fromJson(res?.data);
          FirstStepProvider().saveFirstStepData(data.data);
          GoRouter.of(context).pushNamed(NamedRoutes.registration2);
        });
  }

  void secondStepRegistration(
      {required BuildContext context, required String otp}) async {
    state = true;
    final Response? res =
        await _authServices.secondRegistration(context: context, otp: otp);
    state = false;

    // ignore: use_build_context_synchronously
    httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          GoRouter.of(context).pushNamed(NamedRoutes.registration3);
        });
  }

  void thirdStepRegistration({
    required BuildContext context,
    required String cardNumber,
    required DateTime expireDate,
    required String cvv,
    required String street,
    required String city,
    required String postalCode,
    required String cardType,
  }) async {
    state = true;
    final Response? res = await _authServices.thirdRegistration(
        context: context,
        cardNumber: cardNumber,
        expireDate: expireDate,
        cardType: cardType,
        cvv: cvv,
        street: street,
        city: city,
        postalCode: postalCode);
    state = false;
    // ignore: use_build_context_synchronously
    httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          GoRouter.of(context).pushNamed(NamedRoutes.registration4);
        });
  }

  void fourthStepRegistration(
      {required BuildContext context,
      required WidgetRef ref,
      required String selfieFile,
      required String? selfieName,
      required String bankAccountFile,
      required String? bankAccountName,
      required String pin,
      required String confirmPin}) async {
    state = true;
    final Response? res = await _authServices.fourthRegistration(
        context: context,
        selfieFile: selfieFile,
        selfieName: selfieName,
        bankAccountFile: bankAccountFile,
        bankAccountName: bankAccountName,
        pin: pin,
        confirmPin: confirmPin);
    state = false;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: use_build_context_synchronously
    httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          var userData = User.fromJson(res?.data);
          await prefs.setString("access_token", userData.accessToken);
          ref.watch(userRepositoryProvider.notifier).saveUser(userData);
          GoRouter.of(context).pushReplacementNamed(NamedRoutes.home);
        });
  }

  void login(
      {required BuildContext context,
      required String phoneNumber,
      required String password}) async {
    state = true;
    final Response? res = await _authServices.login(
      context: context,
      phoneNumber: phoneNumber,
      password: password,
    );
    state = false;

    // ignore: use_build_context_synchronously
    httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          GoRouter.of(context).pushReplacementNamed(NamedRoutes.verifyOtp);
        });
  }

  void verifyLoginToken(
      {required BuildContext context,
      required String otp,
      required WidgetRef ref}) async {
    state = true;
    final Response? res =
        await _authServices.verifyToken(context: context, otp: otp);
    state = false;

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // ignore: use_build_context_synchronously
    httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          var userData = User.fromJson(res?.data);
          debugPrint(userData.data.fullName);
          await prefs.setString("access_token", userData.accessToken);
          ref.watch(userRepositoryProvider.notifier).saveUser(userData);
          ref.watch(loggedInProvider).isLoggedIn(true);
          // ignore: use_build_context_synchronously
          GoRouter.of(context).pushReplacementNamed(NamedRoutes.home);
        });
  }
}
