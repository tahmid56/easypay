import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Services/order_services.dart';
import '../models/orderDetails.dart';

final orderDetailsProvider = FutureProvider.family(
  (ref, String arg) async {
    try {
      final res = await ref
          .watch(ordersServicesProvider)
          .getOrderDetails(id: int.parse(arg));
      debugPrint(res?.data.toString());
      if (res?.statusCode == 200) {
        var orderDetails = OrderDetails.fromJson(res?.data);
        // debugPrint(orderDetails.toString());
        return orderDetails;
      } else {}
    } catch (error) {
      
      throw Exception(error.toString());
    }
  },
);
