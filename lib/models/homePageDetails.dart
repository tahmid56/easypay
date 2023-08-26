// To parse this JSON data, do
//
//     final home = homeFromJson(jsonString);

import 'dart:convert';

Home homeFromJson(String str) => Home.fromJson(json.decode(str));

String homeToJson(Home data) => json.encode(data.toJson());

class Home {
    List<UpcomingPayment> upcomingPayments;
    List<DuesInDay> duesIn10Days;
    List<DuesInDay> duesIn21Days;
    List<DuesInDay> duesIn45Days;
    int totalYouOwe;

    Home({
        required this.upcomingPayments,
        required this.duesIn10Days,
        required this.duesIn21Days,
        required this.duesIn45Days,
        required this.totalYouOwe,
    });

    factory Home.fromJson(Map<String, dynamic> json) => Home(
        upcomingPayments: List<UpcomingPayment>.from(json["upcoming_payments"].map((x) => UpcomingPayment.fromJson(x))),
        duesIn10Days: List<DuesInDay>.from(json["dues_in_10_days"].map((x) => DuesInDay.fromJson(x))),
        duesIn21Days: List<DuesInDay>.from(json["dues_in_21_days"].map((x) => DuesInDay.fromJson(x))),
        duesIn45Days: List<DuesInDay>.from(json["dues_in_45_days"].map((x) => DuesInDay.fromJson(x))),
        totalYouOwe: json["total_you_owe"],
    );

    Map<String, dynamic> toJson() => {
        "upcoming_payments": List<dynamic>.from(upcomingPayments.map((x) => x.toJson())),
        "dues_in_10_days": List<dynamic>.from(duesIn10Days.map((x) => x.toJson())),
        "dues_in_21_days": List<dynamic>.from(duesIn21Days.map((x) => x.toJson())),
        "dues_in_45_days": List<dynamic>.from(duesIn45Days.map((x) => x.toJson())),
        "total_you_owe": totalYouOwe,
    };
}

class DuesInDay {
    int orderId;
    double totalDueAmount;

    DuesInDay({
        required this.orderId,
        required this.totalDueAmount,
    });

    factory DuesInDay.fromJson(Map<String, dynamic> json) => DuesInDay(
        orderId: json["order_id"],
        totalDueAmount: json["total_due_amount"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "total_due_amount": totalDueAmount,
    };
}

class UpcomingPayment {
    int orderId;
    int totalAmount;
    DateTime purchasedDate;
    Merchant merchant;
    List<UpcomingDuesInstallment> upcomingDuesInstallment;

    UpcomingPayment({
        required this.orderId,
        required this.totalAmount,
        required this.purchasedDate,
        required this.merchant,
        required this.upcomingDuesInstallment,
    });

    factory UpcomingPayment.fromJson(Map<String, dynamic> json) => UpcomingPayment(
        orderId: json["order_id"],
        totalAmount: json["total_amount"],
        purchasedDate: DateTime.parse(json["purchased_date"]),
        merchant: Merchant.fromJson(json["merchant"]),
        upcomingDuesInstallment: List<UpcomingDuesInstallment>.from(json["upcoming_dues_installment"].map((x) => UpcomingDuesInstallment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "total_amount": totalAmount,
        "purchased_date": purchasedDate.toIso8601String(),
        "merchant": merchant.toJson(),
        "upcoming_dues_installment": List<dynamic>.from(upcomingDuesInstallment.map((x) => x.toJson())),
    };
}

class Merchant {
    String storeName;

    Merchant({
        required this.storeName,
    });

    factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
        storeName: json["store_name"],
    );

    Map<String, dynamic> toJson() => {
        "store_name": storeName,
    };
}

class UpcomingDuesInstallment {
    int id;
    double dueAmount;
    DateTime dueDate;

    UpcomingDuesInstallment({
        required this.id,
        required this.dueAmount,
        required this.dueDate,
    });

    factory UpcomingDuesInstallment.fromJson(Map<String, dynamic> json) => UpcomingDuesInstallment(
        id: json["id"],
        dueAmount: json["due_amount"]?.toDouble(),
        dueDate: DateTime.parse(json["due_date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "due_amount": dueAmount,
        "due_date": "${dueDate.year.toString().padLeft(4, '0')}-${dueDate.month.toString().padLeft(2, '0')}-${dueDate.day.toString().padLeft(2, '0')}",
    };
}
