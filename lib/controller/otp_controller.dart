import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wmapp/constant/constants.dart';
import 'package:wmapp/services/base_client.dart';
import 'package:wmapp/services/error_controller.dart';
import 'package:wmapp/utils/dialog_helper.dart';
import 'package:http/http.dart' as http;

class OTPController extends GetxController with ErrorController {
  late TextEditingController otpC1, otpC2, otpC3, otpC4, otpC5, otpC6;
  String phoneNumber = "";
  String requestId = "";

  @override
  void onInit() {
    super.onInit();
    otpC1 = TextEditingController();
    otpC2 = TextEditingController();
    otpC3 = TextEditingController();
    otpC4 = TextEditingController();
    otpC5 = TextEditingController();
    otpC6 = TextEditingController();
    getArguments();
  }

  void getArguments() {
    var arguments = Get.arguments;
    requestId = arguments[0]["requestId"];
    phoneNumber = arguments[1]["phoneNumber"];
  }

  bool verifyOTP() {
    if (otpC1.value.text.isEmpty ||
        otpC2.value.text.isEmpty ||
        otpC3.value.text.isEmpty ||
        otpC4.value.text.isEmpty ||
        otpC5.value.text.isEmpty ||
        otpC6.value.text.isEmpty) {
      Get.back();
      DialogHelper.showSnackbar("Please Check your OTP..");
      return false;
    }
    return true;
  }

  Future validateOTP() async {
    DialogHelper.showLoader("Validating OTP");
    if (verifyOTP()) {
      String enteredOTP =
          "${otpC1.value.text}${otpC2.value.text}${otpC3.value.text}${otpC4.value.text}${otpC5.value.text}${otpC6.value.text}";
      String url = "$baseUrl/verifyotp.php";
      dynamic payload = {
        "request_id": requestId,
        "code": enteredOTP,
      };
      http.Response? jsonResponse = await BaseClient()
          .postRequest(url, payload, null)
          .catchError(handleError);
      if (jsonResponse != null) {
        var response = jsonDecode(jsonResponse.body);
        Get.back();
        if (response["status"]) {
          storage.write("jwt", response["jwt"]);
          if (response["profile_exists"]) {
            Get.offAllNamed("/home");
          } else {
            Get.offAllNamed("/profileCreate");
          }
        } else {
          DialogHelper.showSnackbar("OOPs! Incorrect OTP...");
        }
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
    otpC1.dispose();
    otpC2.dispose();
    otpC3.dispose();
    otpC4.dispose();
    otpC5.dispose();
    otpC6.dispose();
  }
}
