import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wmapp/constant/color.dart';
import 'package:wmapp/controller/profile_create_controller.dart';
import 'package:wmapp/presentation/widgets/custom_button.dart';
import 'package:wmapp/presentation/widgets/cutsom_textfield.dart';
import 'package:wmapp/utils/dialog_helper.dart';

class ProfileCreateScreen extends StatelessWidget {
  const ProfileCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: GetBuilder<ProfileCreateController>(
          init: Get.put(ProfileCreateController()),
          builder: (controller) => WillPopScope(
            onWillPop: () async {
              final timeGap = DateTime.now().difference(controller.prevback);
              final canExit = timeGap >= const Duration(seconds: 2);
              controller.prevback = DateTime.now();
              if (canExit) {
                DialogHelper.showSnackbar("Press back to exit");
                return false;
              } else {
                return true;
              }
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                      color: black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Looks like you are new here. Tell us a bit about yourself.",
                    style: TextStyle(
                      color: black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomTextField(
                    textController: controller.nameC,
                    hint: "Name",
                  ),
                  CustomTextField(
                    textController: controller.emailC,
                    hint: "Email",
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  CustomButton(
                    buttonText: "Submit",
                    onPressed: () {
                      controller.createProfile();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
