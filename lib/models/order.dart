// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
    List<Datum> data;
    double totalDueAmount;

    Order({
        required this.data,
        required this.totalDueAmount,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        totalDueAmount: json["total_due_amount"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "total_due_amount": totalDueAmount,
    };
}

class Datum {
    int orderId;
    String storeName;
    String storeImgLink;
    List<InstallmentDetail> installmentDetails;

    Datum({
        required this.orderId,
        required this.storeName,
        required this.storeImgLink,
        required this.installmentDetails,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        orderId: json["order_id"],
        storeName: json["store_name"],
        storeImgLink: json["store_img_link"],
        installmentDetails: List<InstallmentDetail>.from(json["installment_details"].map((x) => InstallmentDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "store_name": storeName,
        "store_img_link": storeImgLink,
        "installment_details": List<dynamic>.from(installmentDetails.map((x) => x.toJson())),
    };
}

class InstallmentDetail {
    double dueAmount;
    DateTime dueDate;

    InstallmentDetail({
        required this.dueAmount,
        required this.dueDate,
    });

    factory InstallmentDetail.fromJson(Map<String, dynamic> json) => InstallmentDetail(
        dueAmount: json["due_amount"],
        dueDate: DateTime.parse(json["due_date"]),
    );

    Map<String, dynamic> toJson() => {
        "due_amount": dueAmount,
        "due_date": "${dueDate.year.toString().padLeft(4, '0')}-${dueDate.month.toString().padLeft(2, '0')}-${dueDate.day.toString().padLeft(2, '0')}",
    };
}
