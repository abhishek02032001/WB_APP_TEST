import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wmapp/constant/constants.dart';
import 'package:wmapp/model/sent_otp_model.dart';
import 'package:wmapp/services/base_client.dart';
import 'package:wmapp/services/error_controller.dart';
import 'package:wmapp/utils/dialog_helper.dart';

class LoginController extends GetxController with ErrorController {
  late TextEditingController countryCodeC, phoneNumberC;

  @override
  void onInit() {
    super.onInit();
    countryCodeC = TextEditingController();
    phoneNumberC = TextEditingController();
    countryCodeC.text = "91";
  }

  bool verifyNumber() {
    if (phoneNumberC.value.text.length < 10) {
      Get.back();
      DialogHelper.showSnackbar("Please enter a valid phone number");
      return false;
    }
    if (countryCodeC.value.text.isEmpty) {
      Get.back();
      DialogHelper.showSnackbar("Please Enter a valid country code");
      return false;
    }
    return true;
  }

  Future sendOTP() async {
    DialogHelper.showLoader("Sending OTP");
    if (verifyNumber()) {
      String phoneNumber = phoneNumberC.value.text;
      const String url = "$baseUrl/sendotp.php";
      dynamic payload = {
        "mobile": phoneNumber,
      };
      http.Response? jsonResponse = await BaseClient()
          .postRequest(url, payload, null)
          .catchError(handleError);
      if (jsonResponse != null) {
        SentOtpModel obj = sentOtpModelFromJson(jsonResponse.body);
        Get.back();
        if (obj.status) {
          Get.toNamed(
            "/otp",
            arguments: [
              {
                "requestId": obj.requestId,
              },
              {
                "phoneNumber": phoneNumber,
              }
            ],
          );
        }
      } else {
        DialogHelper.showSnackbar("OOPs! Unable to send OTP.");
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
    countryCodeC.dispose();
    phoneNumberC.dispose();
  }
}
