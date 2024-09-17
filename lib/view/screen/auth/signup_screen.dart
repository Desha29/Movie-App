import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/view/screen/auth/login_screen.dart';
import '../../../../components/components.dart';
import '../../../cubit/signup_cubit/signup_cubit.dart';
import '../../../cubit/signup_cubit/signup_states.dart';
import '../../../components/constant/images_assets.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbody.dart';
import '../../widget/auth/customtextfieldform.dart';
import '../../widget/auth/customtextsign.dart';
import '../../widget/auth/customtitle.dart';
import '../home_screen.dart';
import '../main_wrap.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<SignUpCubit, SignUpStates>(
      builder: (context, state) {
        SignUpCubit cubit = SignUpCubit.get(context);
        return Scaffold(
          backgroundColor: const Color(0xff1f1f1f),
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomTitleAuth(
                height: height,
                width: width,
                text: "Welcome\nto ",
                image: AppImageAssets.posters[0],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: cubit.keystate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextBodyAuth(
                          textitle: "Sign Up",
                          textbody:
                              "Enter username & your email & valid password to create account "),
                      const SizedBox(height: 50),
                      CustomTextFormAuth(
                        keyboardType: TextInputType.text,
                        validate: (val) {
                          return validInput(val!, 5, 15, "username");
                        },
                        labelText: "Username",
                        hinttext: "Enter username",
                        mycontroller: cubit.username,
                        suffix: IconButton(
                            icon: const Icon(Icons.person),
                            onPressed: () {},
                            color: const Color(
                              0xffe50914,
                            )),
                      ),
                      CustomTextFormAuth(
                        keyboardType: TextInputType.emailAddress,
                        validate: (val) {
                          return validInput(val!, 5, 50, "email");
                        },
                        labelText: "Email",
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
                        labelText: "Password",
                        hinttext: "Enter your password",
                        isPassword: cubit.isPassword,
                        mycontroller: cubit.password,
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
                      CustomButtonAuth(
                        text: "Sign Up",
                        onPressed: () async {
                          cubit.signUp();
                        },
                      ),
                      const SizedBox(height: 15),
                      CustomTextSign(
                        text: "Already have an account? ",
                        sign: "Log In",
                        onTap: () {
                          cubit.goToLogin();
                        },
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        );
      },
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          showToast(text: "Sign Up Successfully", color: Colors.green);
          navigateToReplacement(context, const MainWrap());
        } else if (state is SignUpGoToLogin) {
          navigateToReplacement(context, const LoginScreen());
        }
      },
    );
  }
}
