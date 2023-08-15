import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
    List<Datum> data;

    Order({
        required this.data,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int orderId;
    String totalAmount;
    String firstDownPaymentAmount;
    String remainingDueAmount;

    Datum({
        required this.orderId,
        required this.totalAmount,
        required this.firstDownPaymentAmount,
        required this.remainingDueAmount,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        orderId: json["order_id"],
        totalAmount: json["total_amount"],
        firstDownPaymentAmount: json["first_down_payment_amount"],
        remainingDueAmount: json["remaining_due_amount"],
    );

    Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "total_amount": totalAmount,
        "first_down_payment_amount": firstDownPaymentAmount,
        "remaining_due_amount": remainingDueAmount,
    };
}
