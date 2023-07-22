import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:easypay/common/utils/utils.dart';
import 'package:easypay/constants/url.dart';
import 'package:easypay/providers/auth_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_parser/http_parser.dart';

final authServicesProvider = Provider((ref) => AuthServices());

class AuthServices {
  Future<Response?> firstRegistration({
    required BuildContext context,
    required fullName,
    required mobileNumber,
  }) async {
    final dio = Dio();
    dio.options.baseUrl = Urls.baseUrl;
    try {
      Response res = await dio.post(
        Urls.firstRegistrationUrl,
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
        data: {"full_name": fullName, "phone_number": mobileNumber},
      );

      return res;
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return null;
  }

  Future<Response?> secondRegistration(
      {required BuildContext context, required String otp}) async {
    final dio = Dio();
    dio.options.baseUrl = Urls.baseUrl;
    try {
      Response res = await dio.post(
        Urls.secondRegistrationUrl,
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
        data: {"otp": otp},
      );
      return res;
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return null;
  }

  Future<Response?> thirdRegistration(
      {required BuildContext context,
      required Uint8List? nidFrontFile,
      required String? nidFrontName,
      required Uint8List? nidBackFile,
      required String? nidBackName,
      required String permanentAddress,
      required String residentialAddress,
      required Uint8List? jobOfferFile,
      required String? jobOfferName,
      required Uint8List? bankStatement,
      required String? bankStateName,
      }) async {
    final dio = Dio();
    dio.options.baseUrl = Urls.baseUrl;
    try {
      FormData formData = FormData.fromMap({
        "nid_front": MultipartFile.fromBytes(
            (nidFrontFile ?? List<int>.empty()),
            filename: nidFrontName,
            contentType: MediaType("png", "pdf")),
        "nid_back": MultipartFile.fromBytes(
            (nidBackFile ?? List<int>.empty()),
            filename: nidBackName,
            contentType: MediaType("png", "pdf")),
        "residential_address": residentialAddress,
        "permanent_address": permanentAddress,
        "job_offer_latter": MultipartFile.fromBytes(
            (jobOfferFile ?? List<int>.empty()),
            filename: jobOfferName,
            contentType: MediaType("png", "pdf")),
        "bank_statement": MultipartFile.fromBytes(
            (bankStatement ?? List<int>.empty()),
            filename: bankStateName,
            contentType: MediaType("png", "pdf")),
        "user": FirstStepProvider().getFirstRegistrationData()
      });
      formData.fields.map((e) => debugPrint(e.value));
      Response res = await dio.post(Urls.thirdRegistrationUrl,
          options: Options(headers: {"Content-Type": "applciation/json"}),
          data: formData);
      debugPrint(res.data.toString());
      return res;
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(context, e.toString());
    }
    return null;
  }
}
