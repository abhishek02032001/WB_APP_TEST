import 'dart:convert';

SentOtpModel sentOtpModelFromJson(String str) => SentOtpModel.fromJson(json.decode(str));

String sentOtpModelToJson(SentOtpModel data) => json.encode(data.toJson());

class SentOtpModel {
    bool status;
    String response;
    String requestId;

    SentOtpModel({
        required this.status,
        required this.response,
        required this.requestId,
    });

    factory SentOtpModel.fromJson(Map<String, dynamic> json) => SentOtpModel(
        status: json["status"],
        response: json["response"],
        requestId: json["request_id"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "response": response,
        "request_id": requestId,
    };
}
