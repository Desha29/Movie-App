import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/auth/login_controller.dart';
import '../../core/constant/routes.dart';
import '../../data/datasource/dataprovider/remote/firebase_auth_helper.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToLogin();
}

class SignUpImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;

  @override
  signUp() async {
    var formdata = formstate.currentState;

    if (formdata!.validate()) {
      print("Valid");
      await FireBaseHelper()
          .SignUp(username.text.toString(), password.text.toString(),
              email.text.toString())
          .then((value) => {
                if (value is User)
                  {
                    Get.toNamed(AppRoutes.home),
                    Get.delete<SignUpImp>(),
                    dispose(),
                    LoginImp.userName = username.text,
                    LoginImp.userEmail = value.email!,
                    print(LoginImp.userEmail),
                    print(LoginImp.userName)
                  }
                else if (value is String)
                  {
                    Get.back(),
                    Get.showSnackbar(GetSnackBar(
                      messageText: Text(value.toString()),
                      backgroundColor: Colors.red,
                    ))
                  }
              });
    } else {
      print("Not Valid");
    }
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoutes.login);
    Get.delete<SignUpImp>();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
