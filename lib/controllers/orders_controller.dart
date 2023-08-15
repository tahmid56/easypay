import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easypay/Services/order_services.dart';

final authControllerProvider = StateNotifierProvider<OrdersController, bool>(
    (ref) => OrdersController(orderServices: ref.watch(ordersServicesProvider)));

class OrdersController extends StateNotifier<bool> {
  final OrderServices _ordersServices;
  OrdersController({required OrderServices orderServices})
      : _ordersServices = orderServices,
        super(false);

  void getAllOrders(
      {required BuildContext context, required WidgetRef ref}) async {
    state = true;
    final Response? res = await _ordersServices.getAllOrders(context: context);
    state = false;
    debugPrint(res?.data.toString());
    // ignore: use_build_context_synchronously
    // httpErrorHandle(
    //     response: res,
    //     context: context,
    //     onSuccess: () {
    //       List<Order> ordersList = [];
    //       res?.data.map((order) => {ordersList.add(Order.fromJson(order))});

    //       ref.watch(ordersRepositoryProvider.notifier).saveOrders(ordersList);
    //     });
  }
}
