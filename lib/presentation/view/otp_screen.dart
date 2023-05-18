import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wmapp/constant/color.dart';
import 'package:wmapp/constant/size.dart';
import 'package:wmapp/controller/otp_controller.dart';
import 'package:wmapp/presentation/widgets/custom_button.dart';
import 'package:wmapp/presentation/widgets/custom_otp_textfield.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double textBoxSize = (getWidth(context) - 65) / 6;
    return Scaffold(
      body: GetBuilder<OTPController>(
        init: Get.put(OTPController()),
        builder: (controller) => Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: const FittedBox(
                  child: Image(
                    image: AssetImage("assets/icon.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Enter OTP",
                style: TextStyle(
                  color: black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "OTP has been sent to +91 ${controller.phoneNumber}",
                style: TextStyle(
                  color: black,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomOTPTextField(
                    textController: controller.otpC1,
                    textBoxSize: textBoxSize,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                      if (value.isEmpty) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  ),
                  CustomOTPTextField(
                    textController: controller.otpC2,
                    textBoxSize: textBoxSize,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                      if (value.isEmpty) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  ),
                  CustomOTPTextField(
                    textController: controller.otpC3,
                    textBoxSize: textBoxSize,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                      if (value.isEmpty) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  ),
                  CustomOTPTextField(
                    textController: controller.otpC4,
                    textBoxSize: textBoxSize,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                      if (value.isEmpty) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  ),
                  CustomOTPTextField(
                    textController: controller.otpC5,
                    textBoxSize: textBoxSize,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                      if (value.isEmpty) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  ),
                  CustomOTPTextField(
                    textController: controller.otpC6,
                    textBoxSize: textBoxSize,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                      if (value.isEmpty) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              CustomButton(
                buttonText: "Verify",
                onPressed: () {
                  controller.validateOTP();
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Didn't recieve OTP ? ",
                    style: TextStyle(
                      color: black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: "Retry",
                        style: TextStyle(
                          color: black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.back();
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
