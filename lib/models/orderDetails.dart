// To parse this JSON data, do
//
//     final orderDetails = orderDetailsFromJson(jsonString);

import 'dart:convert';

OrderDetails orderDetailsFromJson(String str) => OrderDetails.fromJson(json.decode(str));

String orderDetailsToJson(OrderDetails data) => json.encode(data.toJson());

class OrderDetails {
    Order order;
    List<Due> dues;

    OrderDetails({
        required this.order,
        required this.dues,
    });

    factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
        order: Order.fromJson(json["order"]),
        dues: List<Due>.from(json["dues"].map((x) => Due.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "order": order.toJson(),
        "dues": List<dynamic>.from(dues.map((x) => x.toJson())),
    };
}

class Due {
    int id;
    double dueAmount;
    DateTime dueDate;
    bool isPaid;
    String installment;
    bool isFullPaid;

    Due({
        required this.id,
        required this.dueAmount,
        required this.dueDate,
        required this.isPaid,
        required this.installment,
        required this.isFullPaid,
    });

    factory Due.fromJson(Map<String, dynamic> json) => Due(
        id: json["id"],
        dueAmount: json["due_amount"]?.toDouble(),
        dueDate: DateTime.parse(json["due_date"]),
        isPaid: json["is_paid"],
        installment: json["installment"],
        isFullPaid: json["is_full_paid"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "due_amount": dueAmount,
        "due_date": "${dueDate.year.toString().padLeft(4, '0')}-${dueDate.month.toString().padLeft(2, '0')}-${dueDate.day.toString().padLeft(2, '0')}",
        "is_paid": isPaid,
        "installment": installment,
        "is_full_paid": isFullPaid,
    };
}

class Order {
    int orderId;
    dynamic totalAmount;
    dynamic firstDownPaymentAmount;
    dynamic remainingDueAmount;
    dynamic tax;
    String customerId;
    Merchant merchant;
    dynamic discounts;

    Order({
        required this.orderId,
        required this.totalAmount,
        required this.firstDownPaymentAmount,
        required this.remainingDueAmount,
        required this.tax,
        required this.customerId,
        required this.merchant,
        required this.discounts,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["order_id"],
        totalAmount: json["total_amount"],
        firstDownPaymentAmount: json["first_down_payment_amount"],
        remainingDueAmount: json["remaining_due_amount"],
        tax: json["tax"],
        customerId: json["customer_id"],
        merchant: Merchant.fromJson(json["merchant"]),
        discounts: json["discounts"],
    );

    Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "total_amount": totalAmount,
        "first_down_payment_amount": firstDownPaymentAmount,
        "remaining_due_amount": remainingDueAmount,
        "tax": tax,
        "customer_id": customerId,
        "merchant": merchant.toJson(),
        "discounts": discounts,
    };
}

class Merchant {
    dynamic user;
    String merchantId;
    String storeName;
    String storeWebsite;
    String storeId;

    Merchant({
        required this.user,
        required this.merchantId,
        required this.storeName,
        required this.storeWebsite,
        required this.storeId,
    });

    factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
        user: json["user"],
        merchantId: json["merchant_id"],
        storeName: json["store_name"],
        storeWebsite: json["store_website"],
        storeId: json["store_id"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "merchant_id": merchantId,
        "store_name": storeName,
        "store_website": storeWebsite,
        "store_id": storeId,
    };
}
