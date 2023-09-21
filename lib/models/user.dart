// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String accessToken;
    String refreshToken;
    Data data;

    User({
        required this.accessToken,
        required this.refreshToken,
        required this.data,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    dynamic nidFrontFile;
    dynamic nidBackFile;
    dynamic bankStatementFile;
    dynamic selfieFile;
    DateTime lastLogin;
    bool isSuperuser;
    bool isStaff;
    bool isActive;
    DateTime dateJoined;
    String fullName;
    String phoneNumber;
    dynamic dateOfBirth;
    dynamic street;
    dynamic city;
    dynamic postalCode;
    String userRoll;
    dynamic permanentAddress;
    dynamic residentialAddress;
    dynamic userIp;

    Data({
        required this.id,
        required this.nidFrontFile,
        required this.nidBackFile,
        required this.bankStatementFile,
        required this.selfieFile,
        required this.lastLogin,
        required this.isSuperuser,
        required this.isStaff,
        required this.isActive,
        required this.dateJoined,
        required this.fullName,
        required this.phoneNumber,
        required this.dateOfBirth,
        required this.street,
        required this.city,
        required this.postalCode,
        required this.userRoll,
        required this.permanentAddress,
        required this.residentialAddress,
        required this.userIp,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nidFrontFile: json["nid_front_file"],
        nidBackFile: json["nid_back_file"],
        bankStatementFile: json["bank_statement_file"],
        selfieFile: json["selfie_file"],
        lastLogin: DateTime.parse(json["last_login"]),
        isSuperuser: json["is_superuser"],
        isStaff: json["is_staff"],
        isActive: json["is_active"],
        dateJoined: DateTime.parse(json["date_joined"]),
        fullName: json["full_name"],
        phoneNumber: json["phone_number"],
        dateOfBirth: json["date_of_birth"],
        street: json["street"],
        city: json["city"],
        postalCode: json["postal_code"],
        userRoll: json["user_roll"],
        permanentAddress: json["permanent_address"],
        residentialAddress: json["residential_address"],
        userIp: json["user_ip"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nid_front_file": nidFrontFile,
        "nid_back_file": nidBackFile,
        "bank_statement_file": bankStatementFile,
        "selfie_file": selfieFile,
        "last_login": lastLogin.toIso8601String(),
        "is_superuser": isSuperuser,
        "is_staff": isStaff,
        "is_active": isActive,
        "date_joined": dateJoined.toIso8601String(),
        "full_name": fullName,
        "phone_number": phoneNumber,
        "date_of_birth": dateOfBirth,
        "street": street,
        "city": city,
        "postal_code": postalCode,
        "user_roll": userRoll,
        "permanent_address": permanentAddress,
        "residential_address": residentialAddress,
        "user_ip": userIp,
    };
}
