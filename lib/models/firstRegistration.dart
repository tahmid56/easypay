import 'dart:convert';

FirstRegistrationModel firstRegistrationModelFromJson(String str) => FirstRegistrationModel.fromJson(json.decode(str));

String firstRegistrationModelToJson(FirstRegistrationModel data) => json.encode(data.toJson());

class FirstRegistrationModel {
    String message;
    Data data;

    FirstRegistrationModel({
        required this.message,
        required this.data,
    });

    factory FirstRegistrationModel.fromJson(Map<String, dynamic> json) => FirstRegistrationModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    String fullName;
    String phoneNumber;

    Data({
        required this.fullName,
        required this.phoneNumber,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        fullName: json["full_name"],
        phoneNumber: json["phone_number"],
    );

    Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "phone_number": phoneNumber,
    };
}