import 'dart:typed_data';

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

  void thirdStepRegistration(
      {required BuildContext context,
      required String nidFrontFile,
      required String? nidFrontName,
      required String nidBackFile,
      required String? nidBackName,
      required String permanentAddress,
      required String residentialAddress,
      required String jobOfferFile,
      required String? jobOfferName,
      required String bankStatement,
      required String? bankStateName}) async {
    state = true;
    final Response? res = await _authServices.thirdRegistration(
        context: context,
        nidFrontFile: nidFrontFile,
        nidFrontName: nidFrontName,
        nidBackFile: nidBackFile,
        nidBackName: nidBackName,
        permanentAddress: permanentAddress,
        residentialAddress: residentialAddress,
        jobOfferFile: jobOfferFile,
        jobOfferName: jobOfferName,
        bankStatement: bankStatement,
        bankStateName: bankStateName);
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
    // ignore: use_build_context_synchronously
    httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          GoRouter.of(context).pushReplacementNamed(NamedRoutes.home);
        });
  }
}
