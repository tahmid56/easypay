import 'package:dio/dio.dart';
import 'package:easypay/common/utils/utils.dart';
import 'package:easypay/constants/url.dart';
import 'package:easypay/providers/auth_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final authServicesProvider = Provider((ref) => AuthServices());

class AuthServices {
  List<String>? cookie;
  Future<Response?> firstRegistration({
    required BuildContext context,
    required fullName,
    required mobileNumber,
    required password,
    required DateTime dateTime,
  }) async {
    final dio = Dio();
    dio.options.baseUrl = Urls.baseUrl;
    try {
      Response res = await dio.post(
        Urls.firstRegistrationUrl,
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
        data: {
          "full_name": fullName,
          "phone_number": mobileNumber,
          "password": password,
          "date_of_birth": DateFormat("yyyy-mm-dd").format(dateTime),
        },
      );

      cookie = res.headers['Set-Cookie'];
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
    dio.options.headers['Cookie'] = cookie;
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

  Future<Response?> thirdRegistration({
    required BuildContext context,
    required String cardNumber,
    required DateTime expireDate,
    required String cvv,
    required String street,
    required String city,
    required String postalCode,
    required String cardType,
  }) async {
    final dio = Dio();
    dio.options.baseUrl = Urls.baseUrl;
    dio.options.headers['Cookie'] = cookie;
    try {
      // FormData formData = FormData.fromMap({
      //   "nid_front":
      //       await MultipartFile.fromFile(nidFrontFile, filename: nidFrontName),
      //   "nid_back":
      //       await MultipartFile.fromFile(nidBackFile, filename: nidBackName),
      //   "residential_address": residentialAddress,
      //   "permanent_address": permanentAddress,
      //   "job_offer_latter":
      //       await MultipartFile.fromFile(jobOfferFile, filename: jobOfferName),
      //   "bank_statement": await MultipartFile.fromFile(bankStatement,
      //       filename: bankStateName),
      //   "user": FirstStepProvider().getFirstRegistrationData()
      // });
      debugPrint({
        "card_number": cardNumber.toString(),
        "expiry_month": expireDate.month.toString(),
        "expiry_year": DateFormat('yy').format(expireDate).toString(),
        "cvc": cvv.toString(),
        "street": street.toString(),
        "city": city.toString(),
        "postal_code": postalCode.toString(),
        "card_type": cardType == "MASTERCARD" ? "1" : "2",
      }.toString());
      Response res = await dio.post(Urls.thirdRegistrationUrl,
          options: Options(
            headers: {
              "Content-Type": "multipart/formdata",
            },
          ),
          data: {
            "card_number": cardNumber.toString(),
            "expiry_month": expireDate.month.toString(),
            "expiry_year": DateFormat('yy').format(expireDate).toString(),
            "cvc": cvv.toString(),
            "street": street.toString(),
            "city": city.toString(),
            "postal_code": postalCode.toString(),
            "card_type": cardType == "MASTERCARD" ? "1" : "2",
          });

      debugPrint(cardType);
      return res;
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return null;
  }

  Future<Response?> fourthRegistration(
      {required BuildContext context,
      required String selfieFile,
      required String? selfieName,
      required String bankAccountFile,
      required String? bankAccountName,
      required String pin,
      required String confirmPin}) async {
    final dio = Dio();
    dio.options.baseUrl = Urls.baseUrl;
    dio.options.headers['Cookie'] = cookie;
    try {
      // FormData formData = FormData.fromMap({
      //   "selfie": MultipartFile.fromBytes(
      //     (selfieFile ?? List<int>.empty()),
      //     filename: selfieName,
      //     contentType: MediaType("png", "pdf"),
      //   ),
      //   "bank_account": MultipartFile.fromBytes(
      //       (bankAccountFile ?? List<int>.empty()),
      //       filename: bankAccountName,
      //       contentType: MediaType("png", "pdf")),
      //   "password": pin,
      //   "confirm_pin": confirmPin
      // });

      FormData formData = FormData.fromMap({
        "selfie":
            await MultipartFile.fromFile(selfieFile, filename: selfieName),
        "bank_account": await MultipartFile.fromFile(bankAccountFile,
            filename: bankAccountName),
        "password": pin,
        "confirm_pin": confirmPin,
        'content-type': 'multipart/form-data'
      });
      debugPrint(selfieFile);
      Response res = await dio.post(Urls.fourthRegistrationUrl, data: formData);
      return res;
    } catch (e) {
      debugPrint(selfieName);
      showSnackBar(context, e.toString());
    }
    return null;
  }

  Future<Response?> login(
      {required BuildContext context,
      required String phoneNumber,
      required String password}) async {
    final dio = Dio();
    dio.options.baseUrl = Urls.baseUrl;
    try {
      debugPrint(phoneNumber);
      Response res = await dio.post(Urls.loginUrl,
          data: FormData.fromMap(
              {"phone_number": phoneNumber, "password": password}));

      cookie = res.headers['Set-Cookie'];
      return res;
    } catch (e) {
      // debugPrint(e.toString());
      showSnackBar(context, e.toString());
    }
    return null;
  }

  Future<Response?> verifyToken(
      {required BuildContext context, required String otp}) async {
    final dio = Dio();
    dio.options.baseUrl = Urls.baseUrl;
    dio.options.headers['Cookie'] = cookie;
    try {
      Response res = await dio.post(Urls.verifyLoginOtp,
          data: FormData.fromMap({"otp": otp}));
      return res;
    } catch (error) {
      showSnackBar(context, error.toString());
    }
    return null;
  }
}
