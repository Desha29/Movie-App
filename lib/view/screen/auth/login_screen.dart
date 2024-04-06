import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/view/screen/auth/signup_screen.dart';
import 'package:movie_app/view/screen/home_screen.dart';
import '../../../../components/components.dart';
import '../../../../components/constant/imageassets.dart';
import '../../../cubit/login_cubit/login_cubit.dart';
import '../../../cubit/login_cubit/login_states.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbody.dart';
import '../../widget/auth/customtextfieldform.dart';
import '../../widget/auth/customtextsign.dart';
import '../../widget/auth/customtitle.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<LoginCubit, LoginStates>(builder: (context, state) {
      LoginCubit cubit = LoginCubit.get(context);
      return Scaffold(
        backgroundColor: const Color(0xff1f1f1f),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomTitleAuth(
              height: height,
              width: width,
              text: "Welcome\nBack to ",
              image: AppImageAssets.login2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: cubit.formstate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextBodyAuth(
                        textitle: "Login",
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
                      mycontroller: cubit.email,
                      suffix: IconButton(
                          icon: const Icon(Icons.email_outlined),
                          onPressed: () {},
                          color: const Color(
                            0xffe50914,
                          )),
                    ),
                    CustomTextFormAuth(
                      keyboardType: TextInputType.visiblePassword,
                      validate: (val) {
                        return validInput(val!, 5, 30, "password");
                      },
                      labeltext: "Password",
                      hinttext: "Enter your password",
                      mycontroller: cubit.password,
                      isPassword: cubit.isPassword,
                      suffix: IconButton(
                          icon: Icon(cubit.visible
                              ? Icons.remove_red_eye
                              : Icons.visibility_off_sharp),
                          onPressed: () {
                            cubit.showPassword();
                          },
                          color: const Color(
                            0xffe50914,
                          )),
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
                        cubit.login();
                      },
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: InkWell(
                        onTap: () {
                          cubit.loginWithGoogle();
                        },
                        child: Container(
                          height: 48,
                          width: 300,
                          padding: const EdgeInsets.symmetric(horizontal: 60),
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
                              const Text(
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
                        cubit.goToSignUp();
                      },
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      );
    }, listener: (context, state) {
      if (state is LoginSuccessState) {
        showToast(text: "Login Successfully", color: Colors.green);

        navigateToReplacement(context, HomeScreen());
      }
      if (state is LoginGoToSignUpState) {
        navigateToReplacement(context, const SignUpScreen());
      }
      if (state is LoginWithGoogleState) {
        showToast(text: "Login Successfully", color: Colors.green);
        navigateToReplacement(context, HomeScreen());
      }
    });
  }
}
