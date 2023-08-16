import 'package:dio/dio.dart';
import 'package:easypay/common/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/url.dart';

final ordersServicesProvider = Provider((ref) => OrderServices());

class OrderServices {
  Future<Response?> getAllOrders({required BuildContext context}) async {
    final dio = Dio();
    dio.options.baseUrl = Urls.baseUrl;
    try {
      Response res = await dio.get(
        Urls.ordersUrl,
      );

      return res;
    } catch (error) {
      showSnackBar(context, error.toString());
    }
    return null;
  }

  Future<Response?> getOrderDetails({required int id}) async {
    final dio = Dio();
    dio.options.baseUrl = Urls.baseUrl;
    try {
      Response res = await dio.get(
        "${Urls.orderDetailsUrl}$id",
      );
      return res;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
