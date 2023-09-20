// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
    List<Datum> data;
    double dueTotalAmount;

    Order({
        required this.data,
        required this.dueTotalAmount,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        dueTotalAmount: json["due_total_amount"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "due_total_amount": dueTotalAmount,
    };
}

class Datum {
    int orderId;
    String storeName;
    String storeImgLink;
    DateTime purchasedDate;
    String status;
    double amount;

    Datum({
        required this.orderId,
        required this.storeName,
        required this.storeImgLink,
        required this.purchasedDate,
        required this.status,
        required this.amount,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        orderId: json["order_id"],
        storeName: json["store_name"],
        storeImgLink: json["store_img_link"],
        purchasedDate: DateTime.parse(json["purchased_date"]),
        status: json["status"],
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "store_name": storeName,
        "store_img_link": storeImgLink,
        "purchased_date": purchasedDate.toIso8601String(),
        "status": status,
        "amount": amount,
    };
}





class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
