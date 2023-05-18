import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wmapp/constant/color.dart';

class DialogHelper {
  //Loader Dialog
  static void showLoader(String title) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 10.0),
              Text(
                title,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Show Snackbar
  static void showSnackbar(String message) {
    Get.snackbar(
      "Star Mitra",
      message,
      duration: const Duration(seconds: 2),
      backgroundColor: grey,
      borderRadius: 10.0,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Error Dialog
  static void showErrorDialog(String title, String description) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
              ),
              Text(
                description,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                  Get.back();
                },
                child: const Text(
                  "Back",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
