import 'package:flutter/material.dart';
import 'package:wmapp/constant/color.dart';
import 'package:wmapp/utils/dialog_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime prevback = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "WB App",
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          final timeGap = DateTime.now().difference(prevback);
          final canExit = timeGap >= const Duration(seconds: 2);
          prevback = DateTime.now();
          if (canExit) {
            DialogHelper.showSnackbar("Press back to exit.");
            return false;
          } else {
            return true;
          }
        },
        child: Center(
          child: Text(
            "Home Page",
            style: TextStyle(
              color: black,
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
            ),
          ),
        ),
      ),
    );
  }
}
