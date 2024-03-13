import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/instance_manager.dart';
import 'package:movie_app/data/datasource/dataprovider/remote/firebase_auth_helper.dart';
import '/../controller/auth/login_controller.dart';
import '/../core/constant/imageassets.dart';
import '/../core/functions/functions.dart';
import '/../view/widget/auth/custombuttonauth.dart';
import '/../view/widget/auth/customtextbody.dart';
import '/../view/widget/auth/customtextfieldform.dart';
import '/../view/widget/auth/customtextsign.dart';
import '/../view/widget/auth/customtitle.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    LoginImp controller = Get.put(LoginImp());
    return Scaffold(
      backgroundColor: const Color(0xff1f1f1f),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomTitleAuth(
            height: height,
            width: width,
            text: "Welcome\nBack to ",
            image: AppImageAssets.login2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: controller.formstate,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextBodyAuth(
                      texttitle: "Login",
                      textbody:
                          "Enter your email & valid password to continue"),
                  const SizedBox(height: 40),
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
                  Container(
                    margin: const EdgeInsets.only(left: 190, bottom: 10),
                    child: const Text(
                      "Forget Password ?",
                      textAlign: TextAlign.end,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomButtonAuth(
                    text: "Log In",
                    onPressed: () {
                      controller.login();
                    },
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: InkWell(
                      onTap: () {
                        FireBaseHelper().signInWithGoogle();
                      },
                      child: Container(
                        height: 48,
                        width: 300,
                        padding: EdgeInsets.symmetric(horizontal: 60),
                        decoration: const BoxDecoration(
                            color: Color(0xff313131),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.transparent,
                              child: Image.asset(AppImageAssets.google),
                            ),
                            Text(
                              "Log in with Google",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomTextSign(
                    text: "Don't have an account? ",
                    sign: "Sign Up",
                    onTap: () {
                      controller.goToSignUp();
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
