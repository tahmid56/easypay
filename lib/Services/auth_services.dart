import 'package:dio/dio.dart';
import 'package:easypay/common/utils/utils.dart';
import 'package:easypay/constants/url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  }
}
