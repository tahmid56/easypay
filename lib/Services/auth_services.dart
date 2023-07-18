import 'package:dio/dio.dart';
import 'package:easypay/common/utils/error_handling.dart';
import 'package:easypay/common/utils/utils.dart';
import 'package:easypay/constants/url.dart';
import 'package:easypay/models/firstRegistration.dart';
import 'package:easypay/providers/auth_provider.dart';
import 'package:easypay/route/named_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AuthServices {
  void firstRegistration({
    required BuildContext context,
    required fullName,
    required mobileNumber,
  }) async {
    final dio = Dio();
    dio.options.baseUrl = Urls.baseUrl;
    try {
      Response res = await dio.post(Urls.firstRegistrationUrl,
          options: Options(
            headers: {"Content-Type": "application/json"},
          ),
          data: {"full_name": fullName, "phone_number": mobileNumber});
      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            var data = FirstRegistrationModel.fromJson(res.data);
            FirstStepProvider().saveFirstStepData(data.data);
            GoRouter.of(context).pushNamed(NamedRoutes.registration2);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
