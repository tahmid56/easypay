import 'package:easypay/Services/order_services.dart';

import 'package:easypay/common/utils/utils.dart';
import 'package:easypay/models/order.dart';
import 'package:easypay/route/named_routes.dart';
import 'package:easypay/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// final ordersRepositoryProvider =
//     StateNotifierProvider<OrderRepository, List<Order>?>((ref) => OrderRepository());

// class OrderRepository extends StateNotifier<List<Order>> {
//   OrderRepository() : super([]);

//   void saveOrders(List<Order> orders) {
//     state = orders;
//   }
// }

final ordersProvider = FutureProvider.family((ref, BuildContext context) async {
  try {
    final res =
        await ref.watch(ordersServicesProvider).getAllOrders(context: context);
    if (res?.statusCode == 200) {
      var orders = Order.fromJson(res?.data);
      debugPrint(orders.dueTotalAmount.toString());
      return orders;
    } else if (res?.statusCode == 401) {
      GoRouter.of(context).pushReplacementNamed(NamedRoutes.login);
    } else {
      debugPrint(res?.data.toString());
      showSnackBar(context, "Something Went wrong");
    }
  } catch (e) {
    showSnackBar(context, e.toString());
  }
});
