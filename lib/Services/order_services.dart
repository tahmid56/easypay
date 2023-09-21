import 'package:dio/dio.dart';
import 'package:easypay/common/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/url.dart';

final ordersServicesProvider = Provider((ref) => OrderServices());

class OrderServices {
  Future<Response?> getAllOrders({required BuildContext context}) async {
    final dio = Dio();
    dio.options.baseUrl = Urls.baseUrl;
    final token = await SharedPreferences.getInstance();
    debugPrint(token.getString("access_token"));
    try {
      Response res = await dio.get(Urls.ordersUrl,
          options: Options(headers: {
            "authorization": "Bearer ${token.getString("access_token")}"
          }));

      return res;
    } catch (error) {
      showSnackBar(context, error.toString());
    }
    return null;
  }

  Future<Response?> getOrderDetails({required int id}) async {
    final dio = Dio();
    dio.options.baseUrl = Urls.baseUrl;
    final token = await SharedPreferences.getInstance();

    try {
      Response res = await dio.get("${Urls.orderDetailsUrl}$id",
          options: Options(headers: {
            "authorization": "Bearer ${token.getString("access_token")}"
          }));
      return res;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response?> getUpcomingPayments({required BuildContext context}) async {
    final dio = Dio();
    dio.options.baseUrl = Urls.baseUrl;
    final token = await SharedPreferences.getInstance();
    try {
      Response res = await dio.get(Urls.upcomingPaymentUrl,
          options: Options(headers: {
            "authorization": "Bearer ${token.getString("access_token")}"
          }));
      
      return res;
    } catch (error) {
      showSnackBar(context, error.toString());
    }
    return null;
  }
}
