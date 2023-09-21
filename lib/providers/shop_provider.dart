import 'package:dio/dio.dart';
import 'package:easypay/Services/order_services.dart';
import 'package:easypay/common/utils/utils.dart';
import 'package:easypay/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/url.dart';

final shopProvider = FutureProvider.family(
  (ref, BuildContext context) async {
    try {
      final res =
          await ref.watch(ordersServicesProvider).getShops(context: context);
      var shops = Shop.fromJson(res?.data);
      return shops;
    } catch (error) {
      showSnackBar(context, error.toString());
    }
  },
);
