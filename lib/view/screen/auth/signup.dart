import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import '/../controller/auth/signup_controller.dart';
import '/../core/constant/imageassets.dart';
import '../../../core/functions/functions.dart';
import '/../view/widget/auth/custombuttonauth.dart';
import '/../view/widget/auth/customtextbody.dart';
import '/../view/widget/auth/customtextfieldform.dart';
import '/../view/widget/auth/customtextsign.dart';
import '/../view/widget/auth/customtitle.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SignUpImp controller = Get.put(SignUpImp());
    return Scaffold(
      backgroundColor: const Color(0xff1f1f1f),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomTitleAuth(
            height: height,
            width: width,
            text: "Welcome\nto ",
            image: AppImageAssets.posters[0],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: controller.formstate,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextBodyAuth(
                      texttitle: "Sign Up",
                      textbody:
                          "Enter username & your email & valid password to create account "),
                  const SizedBox(height: 50),
                  CustomTextFormAuth(
                    keyboardType: TextInputType.text,
                    validate: (val) {
                      return validInput(val!, 5, 15, "username");
                    },
                    labeltext: "Username",
                    hinttext: "Enter username",
                    iconData: Icons.person,
                    mycontroller: controller.username,
                  ),
                  CustomTextFormAuth(
                    keyboardType: TextInputType.emailAddress,
                    validate: (val) {
                      return validInput(val!, 5, 50, "email");
                    },
                    labeltext: "Email",
                    hinttext: "Enter your Email",
                    iconData: Icons.email_outlined,
                    mycontroller: controller.email,
                  ),
                  CustomTextFormAuth(
                    keyboardType: TextInputType.visiblePassword,
                    validate: (val) {
                      return validInput(val!, 5, 30, "password");
                    },
                    labeltext: "Password",
                    hinttext: "Enter your password",
                    iconData: Icons.visibility_off,
                    mycontroller: controller.password,
                  ),
                  CustomButtonAuth(
                    text: "Sign Up",
                    onPressed: () async {
                      await controller.signUp();
                    },
                  ),
                  SizedBox(height: 15),
                  CustomTextSign(
                    text: "Already have an account? ",
                    sign: "Log In",
                    onTap: () {
                      controller.goToLogin();
                    },
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
