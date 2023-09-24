// To parse this JSON data, do
//
//     final orderDetails = orderDetailsFromJson(jsonString);

import 'dart:convert';

OrderDetails orderDetailsFromJson(String str) => OrderDetails.fromJson(json.decode(str));

String orderDetailsToJson(OrderDetails data) => json.encode(data.toJson());

class OrderDetails {
    Order? order;
    List<dynamic>? dues;

    OrderDetails({
        this.order,
        this.dues,
    });

    factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
        order: json["order"] == null ? null : Order.fromJson(json["order"]),
        dues: json["dues"] == null ? [] : List<dynamic>.from(json["dues"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "order": order?.toJson(),
        "dues": dues == null ? [] : List<dynamic>.from(dues!.map((x) => x)),
    };
}

class Order {
    int? orderId;
    double? totalAmount;
    double? firstDownPaymentAmount;
    double? remainingDueAmount;
    dynamic tax;
    String? customerId;
    Merchant? merchant;
    dynamic discounts;

    Order({
        this.orderId,
        this.totalAmount,
        this.firstDownPaymentAmount,
        this.remainingDueAmount,
        this.tax,
        this.customerId,
        this.merchant,
        this.discounts,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["order_id"],
        totalAmount: json["total_amount"],
        firstDownPaymentAmount: json["first_down_payment_amount"],
        remainingDueAmount: json["remaining_due_amount"],
        tax: json["tax"],
        customerId: json["customer_id"],
        merchant: json["merchant"] == null ? null : Merchant.fromJson(json["merchant"]),
        discounts: json["discounts"],
    );

    Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "total_amount": totalAmount,
        "first_down_payment_amount": firstDownPaymentAmount,
        "remaining_due_amount": remainingDueAmount,
        "tax": tax,
        "customer_id": customerId,
        "merchant": merchant?.toJson(),
        "discounts": discounts,
    };
}

class Merchant {
    String? user;
    String? merchantId;
    String? storeName;
    dynamic storeWebsite;
    String? storeId;

    Merchant({
        this.user,
        this.merchantId,
        this.storeName,
        this.storeWebsite,
        this.storeId,
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
