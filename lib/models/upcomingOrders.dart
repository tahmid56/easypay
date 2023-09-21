import 'dart:convert';

class UpcomingOrder {
    List<UpcomingPayment>? upcomingPayments;
    List<DuesInDay>? duesIn15Days;
    List<DuesInDay>? duesIn30Days;
    List<DuesInDay>? duesIn45Days;
    int? creditLimit;
    double? totalDueAmount;

    UpcomingOrder({
        this.upcomingPayments,
        this.duesIn15Days,
        this.duesIn30Days,
        this.duesIn45Days,
        this.creditLimit,
        this.totalDueAmount,
    });

    factory UpcomingOrder.fromRawJson(String str) => UpcomingOrder.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpcomingOrder.fromJson(Map<String, dynamic> json) => UpcomingOrder(
        upcomingPayments: json["upcoming_payments"] == null ? [] : List<UpcomingPayment>.from(json["upcoming_payments"]!.map((x) => UpcomingPayment.fromJson(x))),
        duesIn15Days: json["dues_in_15_days"] == null ? [] : List<DuesInDay>.from(json["dues_in_15_days"]!.map((x) => DuesInDay.fromJson(x))),
        duesIn30Days: json["dues_in_30_days"] == null ? [] : List<DuesInDay>.from(json["dues_in_30_days"]!.map((x) => DuesInDay.fromJson(x))),
        duesIn45Days: json["dues_in_45_days"] == null ? [] : List<DuesInDay>.from(json["dues_in_45_days"]!.map((x) => DuesInDay.fromJson(x))),
        creditLimit: json["credit_limit"],
        totalDueAmount: json["total_due_amount"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "upcoming_payments": upcomingPayments == null ? [] : List<dynamic>.from(upcomingPayments!.map((x) => x.toJson())),
        "dues_in_15_days": duesIn15Days == null ? [] : List<dynamic>.from(duesIn15Days!.map((x) => x.toJson())),
        "dues_in_30_days": duesIn30Days == null ? [] : List<dynamic>.from(duesIn30Days!.map((x) => x.toJson())),
        "dues_in_45_days": duesIn45Days == null ? [] : List<dynamic>.from(duesIn45Days!.map((x) => x.toJson())),
        "credit_limit": creditLimit,
        "total_due_amount": totalDueAmount,
    };
}

class DuesInDay {
    double? totalDueAmount;

    DuesInDay({
        this.totalDueAmount,
    });

    factory DuesInDay.fromRawJson(String str) => DuesInDay.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DuesInDay.fromJson(Map<String, dynamic> json) => DuesInDay(
        totalDueAmount: json["total_due_amount"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "total_due_amount": totalDueAmount,
    };
}

class UpcomingPayment {
    int? orderId;
    double? totalAmount;
    DateTime? purchasedDate;
    Merchant? merchant;
    List<UpcomingDuesInstallment>? upcomingDuesInstallment;

    UpcomingPayment({
        this.orderId,
        this.totalAmount,
        this.purchasedDate,
        this.merchant,
        this.upcomingDuesInstallment,
    });

    factory UpcomingPayment.fromRawJson(String str) => UpcomingPayment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpcomingPayment.fromJson(Map<String, dynamic> json) => UpcomingPayment(
        orderId: json["order_id"],
        totalAmount: json["total_amount"],
        purchasedDate: json["purchased_date"] == null ? null : DateTime.parse(json["purchased_date"]),
        merchant: json["merchant"] == null ? null : Merchant.fromJson(json["merchant"]),
        upcomingDuesInstallment: json["upcoming_dues_installment"] == null ? [] : List<UpcomingDuesInstallment>.from(json["upcoming_dues_installment"]!.map((x) => UpcomingDuesInstallment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "total_amount": totalAmount,
        "purchased_date": purchasedDate?.toIso8601String(),
        "merchant": merchant?.toJson(),
        "upcoming_dues_installment": upcomingDuesInstallment == null ? [] : List<dynamic>.from(upcomingDuesInstallment!.map((x) => x.toJson())),
    };
}

class Merchant {
    String? storeName;

    Merchant({
        this.storeName,
    });

    factory Merchant.fromRawJson(String str) => Merchant.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
        storeName: json["store_name"],
    );

    Map<String, dynamic> toJson() => {
        "store_name": storeName,
    };
}

class UpcomingDuesInstallment {
    int? id;
    double? dueAmount;
    DateTime? dueDate;

    UpcomingDuesInstallment({
        this.id,
        this.dueAmount,
        this.dueDate,
    });

    factory UpcomingDuesInstallment.fromRawJson(String str) => UpcomingDuesInstallment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpcomingDuesInstallment.fromJson(Map<String, dynamic> json) => UpcomingDuesInstallment(
        id: json["id"],
        dueAmount: json["due_amount"],
        dueDate: json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "due_amount": dueAmount,
        "due_date": "${dueDate!.year.toString().padLeft(4, '0')}-${dueDate!.month.toString().padLeft(2, '0')}-${dueDate!.day.toString().padLeft(2, '0')}",
    };
}
