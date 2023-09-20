// To parse this JSON data, do
//
//     final upcomingOrders = upcomingOrdersFromJson(jsonString);

import 'dart:convert';

UpcomingOrders upcomingOrdersFromJson(String str) => UpcomingOrders.fromJson(json.decode(str));

String upcomingOrdersToJson(UpcomingOrders data) => json.encode(data.toJson());

class UpcomingOrders {
    List<AllOrdersWithDue> allOrdersWithDues;
    List<UpcomingPayment> upcomingPayments;

    UpcomingOrders({
        required this.allOrdersWithDues,
        required this.upcomingPayments,
    });

    factory UpcomingOrders.fromJson(Map<String, dynamic> json) => UpcomingOrders(
        allOrdersWithDues: List<AllOrdersWithDue>.from(json["all_orders_with_dues"].map((x) => AllOrdersWithDue.fromJson(x))),
        upcomingPayments: List<UpcomingPayment>.from(json["upcoming_payments"].map((x) => UpcomingPayment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "all_orders_with_dues": List<dynamic>.from(allOrdersWithDues.map((x) => x.toJson())),
        "upcoming_payments": List<dynamic>.from(upcomingPayments.map((x) => x.toJson())),
    };
}

class AllOrdersWithDue {
    int orderId;
    int totalAmount;
    int firstDownPaymentAmount;
    int remainingDueAmount;
    dynamic tax;
    String customerId;
    Merchant merchant;
    dynamic discounts;
    String? customerAddress;
    String? products;
    bool isFullPaid;
    String due;
    List<Due> dues;

    AllOrdersWithDue({
        required this.orderId,
        required this.totalAmount,
        required this.firstDownPaymentAmount,
        required this.remainingDueAmount,
        required this.tax,
        required this.customerId,
        required this.merchant,
        required this.discounts,
        required this.customerAddress,
        required this.products,
        required this.isFullPaid,
        required this.due,
        required this.dues,
    });

    factory AllOrdersWithDue.fromJson(Map<String, dynamic> json) => AllOrdersWithDue(
        orderId: json["order_id"],
        totalAmount: json["total_amount"],
        firstDownPaymentAmount: json["first_down_payment_amount"],
        remainingDueAmount: json["remaining_due_amount"],
        tax: json["tax"],
        customerId: json["customer_id"],
        merchant: Merchant.fromJson(json["merchant"]),
        discounts: json["discounts"],
        customerAddress: json["customer_address"],
        products: json["products"],
        isFullPaid: json["is_full_paid"],
        due: json["due"],
        dues: List<Due>.from(json["dues"].map((x) => Due.fromJson(x))),
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
        "customer_address": customerAddress,
        "products": products,
        "is_full_paid": isFullPaid,
        "due": due,
        "dues": List<dynamic>.from(dues.map((x) => x.toJson())),
    };
}

class Due {
    int id;
    double dueAmount;
    dynamic dueNumber;
    DateTime dueDate;
    bool isPaid;
    Installment installment;

    Due({
        required this.id,
        required this.dueAmount,
        required this.dueNumber,
        required this.dueDate,
        required this.isPaid,
        required this.installment,
    });

    factory Due.fromJson(Map<String, dynamic> json) => Due(
        id: json["id"],
        dueAmount: json["due_amount"]?.toDouble(),
        dueNumber: json["due_number"],
        dueDate: DateTime.parse(json["due_date"]),
        isPaid: json["is_paid"],
        installment: installmentValues.map[json["installment"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "due_amount": dueAmount,
        "due_number": dueNumber,
        "due_date": "${dueDate.year.toString().padLeft(4, '0')}-${dueDate.month.toString().padLeft(2, '0')}-${dueDate.day.toString().padLeft(2, '0')}",
        "is_paid": isPaid,
        "installment": installmentValues.reverse[installment],
    };
}

enum Installment {
    FIRST,
    FOURTH,
    SECOND,
    THIRD
}

final installmentValues = EnumValues({
    "First": Installment.FIRST,
    "Fourth": Installment.FOURTH,
    "Second": Installment.SECOND,
    "Third": Installment.THIRD
});

class Merchant {
    User user;
    String merchantId;
    StoreName storeName;
    String storeWebsite;
    String storeId;
    String wallet;
    dynamic ledgerInfo;

    Merchant({
        required this.user,
        required this.merchantId,
        required this.storeName,
        required this.storeWebsite,
        required this.storeId,
        required this.wallet,
        required this.ledgerInfo,
    });

    factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
        user: userValues.map[json["user"]]!,
        merchantId: json["merchant_id"],
        storeName: storeNameValues.map[json["store_name"]]!,
        storeWebsite: json["store_website"],
        storeId: json["store_id"],
        wallet: json["wallet"],
        ledgerInfo: json["ledger_info"],
    );

    Map<String, dynamic> toJson() => {
        "user": userValues.reverse[user],
        "merchant_id": merchantId,
        "store_name": storeNameValues.reverse[storeName],
        "store_website": storeWebsite,
        "store_id": storeId,
        "wallet": wallet,
        "ledger_info": ledgerInfo,
    };
}

enum StoreName {
    MEDICIFY
}

final storeNameValues = EnumValues({
    "Medicify": StoreName.MEDICIFY
});

enum User {
    ARAFAT
}

final userValues = EnumValues({
    "Arafat": User.ARAFAT
});

class UpcomingPayment {
    int orderId;
    int totalAmount;
    int firstDownPaymentAmount;
    int remainingDueAmount;
    dynamic tax;
    String customerId;
    Merchant merchant;
    dynamic discounts;
    List<Due> upcomingPayments;

    UpcomingPayment({
        required this.orderId,
        required this.totalAmount,
        required this.firstDownPaymentAmount,
        required this.remainingDueAmount,
        required this.tax,
        required this.customerId,
        required this.merchant,
        required this.discounts,
        required this.upcomingPayments,
    });

    factory UpcomingPayment.fromJson(Map<String, dynamic> json) => UpcomingPayment(
        orderId: json["order_id"],
        totalAmount: json["total_amount"],
        firstDownPaymentAmount: json["first_down_payment_amount"],
        remainingDueAmount: json["remaining_due_amount"],
        tax: json["tax"],
        customerId: json["customer_id"],
        merchant: Merchant.fromJson(json["merchant"]),
        discounts: json["discounts"],
        upcomingPayments: List<Due>.from(json["upcoming_payments"].map((x) => Due.fromJson(x))),
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
        "upcoming_payments": List<dynamic>.from(upcomingPayments.map((x) => x.toJson())),
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
