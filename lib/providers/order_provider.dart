import 'package:easypay/Services/order_services.dart';
import 'package:easypay/common/utils/error_handling.dart';
import 'package:easypay/common/utils/utils.dart';
import 'package:easypay/models/order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      debugPrint(orders.data.toString());
      return orders.data;
    } else {
      showSnackBar(context, "Something Went wrong");
      return [];
    }
  } catch (e) {
    showSnackBar(context, e.toString());
  }
});
