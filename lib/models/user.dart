// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String token;
    Data data;

    User({
        required this.token,
        required this.data,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        token: json["token"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    String nidFrontFile;
    String nidBackFile;
    String jobOfferFile;
    String bankStatementFile;
    String selfieFile;
    String bankAccountFile;
    String password;
    dynamic lastLogin;
    bool isSuperuser;
    bool isStaff;
    bool isActive;
    DateTime dateJoined;
    String fullName;
    String phoneNumber;
    String permanentAddress;
    String residentialAddress;
    String userRoll;
    String userIp;

    Data({
        required this.id,
        required this.nidFrontFile,
        required this.nidBackFile,
        required this.jobOfferFile,
        required this.bankStatementFile,
        required this.selfieFile,
        required this.bankAccountFile,
        required this.password,
        this.lastLogin,
        required this.isSuperuser,
        required this.isStaff,
        required this.isActive,
        required this.dateJoined,
        required this.fullName,
        required this.phoneNumber,
        required this.permanentAddress,
        required this.residentialAddress,
        required this.userRoll,
        required this.userIp,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nidFrontFile: json["nid_front_file"],
        nidBackFile: json["nid_back_file"],
        jobOfferFile: json["job_offer_file"],
        bankStatementFile: json["bank_statement_file"],
        selfieFile: json["selfie_file"],
        bankAccountFile: json["bank_account_file"],
        password: json["password"],
        lastLogin: json["last_login"],
        isSuperuser: json["is_superuser"],
        isStaff: json["is_staff"],
        isActive: json["is_active"],
        dateJoined: DateTime.parse(json["date_joined"]),
        fullName: json["full_name"],
        phoneNumber: json["phone_number"],
        permanentAddress: json["permanent_address"],
        residentialAddress: json["residential_address"],
        userRoll: json["user_roll"],
        userIp: json["user_ip"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nid_front_file": nidFrontFile,
        "nid_back_file": nidBackFile,
        "job_offer_file": jobOfferFile,
        "bank_statement_file": bankStatementFile,
        "selfie_file": selfieFile,
        "bank_account_file": bankAccountFile,
        "password": password,
        "last_login": lastLogin,
        "is_superuser": isSuperuser,
        "is_staff": isStaff,
        "is_active": isActive,
        "date_joined": dateJoined.toIso8601String(),
        "full_name": fullName,
        "phone_number": phoneNumber,
        "permanent_address": permanentAddress,
        "residential_address": residentialAddress,
        "user_roll": userRoll,
        "user_ip": userIp,
    };
}
