import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wmapp/constant/constants.dart';
import 'package:wmapp/services/base_client.dart';
import 'package:wmapp/services/error_controller.dart';
import 'package:wmapp/utils/dialog_helper.dart';
import 'package:http/http.dart' as http;

class ProfileCreateController extends GetxController with ErrorController {
  late TextEditingController nameC, emailC;
  DateTime prevback = DateTime.now();

  @override
  void onInit() {
    super.onInit();
    nameC = TextEditingController();
    emailC = TextEditingController();
  }

  bool verifyNameAndEmail() {
    if (nameC.value.text.isEmpty) {
      Get.back();
      DialogHelper.showSnackbar("Enter a valid name.");
      return false;
    }
    if (emailC.value.text.isEmpty || !emailC.value.text.isEmail) {
      Get.back();
      DialogHelper.showSnackbar("Enter a valid email.");
      return false;
    }
    return true;
  }

  Future createProfile() async {
    DialogHelper.showLoader("Create Profile");
    if (verifyNameAndEmail()) {
      String name = nameC.value.text;
      String email = emailC.value.text;
      String token = storage.read("jwt");
      String url = "$baseUrl/profilesubmit.php";
      dynamic payload = {
        "name": name,
        "email": email,
      };
      dynamic header = {
        "Token": token,
      };
      http.Response? jsonResponse = await BaseClient()
          .postRequest(url, payload, header)
          .catchError(handleError);
      print(jsonResponse!.body);
      if (jsonResponse != null) {
        var response = jsonDecode(jsonResponse.body);
        Get.back();
        if (response["status"]) {
          Get.offAllNamed("home");
        } else {
          DialogHelper.showSnackbar(
              "Unable to create profile.. Please try again");
        }
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
    nameC.dispose();
    emailC.dispose();
  }
}
