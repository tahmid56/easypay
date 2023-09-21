import 'package:easypay/Services/order_services.dart';
import 'package:easypay/common/utils/utils.dart';

import 'package:easypay/models/upcomingOrders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final upcomingPaymentProvider =
    FutureProvider.family((ref, BuildContext context) async {
  try {
    final res = await ref
        .watch(ordersServicesProvider)
        .getUpcomingPayments(context: context);
    if (res?.statusCode == 200) {
      var upcomingPayments = UpcomingOrder.fromJson(res?.data);
      
      return upcomingPayments;
    }
  } catch (e) {
    debugPrint(e.toString());
    showSnackBar(context, e.toString());
  }
});
