import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:easypay/common/utils/utils.dart';
import 'package:flutter/material.dart';

void httpErrorHandle({
  required dio.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 201:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.data)['message']);
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.data)['error']);
      break;
    case 404:
      showSnackBar(context, jsonDecode(response.data)['message']);
      break;
    default:
      showSnackBar(context, response.statusCode.toString());
  }
}
