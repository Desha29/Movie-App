// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/constant/routes.dart';
import '../../data/datasource/dataprovider/remote/firebase_auth_helper.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
}

class LoginImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  static String userName = "";
  static String userEmail = "";
  @override
  login() async {
    var formdata = formstate.currentState;

    if (formdata!.validate()) {
      print("Valid");
      await FireBaseHelper()
          .SignIn(email.text.toString(), password.text.toString())
          .then((value) => {
                if (value is User)
                  {
                    Get.toNamed(AppRoutes.home),
                    Get.delete<LoginImp>(),
                    dispose(),
                    userName = value.displayName!.toString(),
                    userEmail = value.email!.toString(),
                    print(userEmail),
                    print(userName)
                  }
                else
                  {
                    Get.back(),
                    Get.showSnackbar(GetSnackBar(
                      messageText: Text(value.toString()),
                      backgroundColor: Colors.red,
                    )),
                  }
              });
    } else {
      print("Not Valid");
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signup);
    Get.delete<LoginImp>();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
