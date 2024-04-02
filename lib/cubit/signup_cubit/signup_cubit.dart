import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/components/components.dart';
import 'package:movie_app/cubit/login_cubit/login_cubit.dart';
import 'package:movie_app/cubit/signup_cubit/signup_states.dart';
import 'package:movie_app/data/firebase/firebase_auth_helper.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());
  static SignUpCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> keystate = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool visible = false;
  bool isPassword = true;

  void signUp() async {
    var foredate = keystate.currentState;

    if (foredate!.validate()) {
      print("Valid");
      await FireBaseHelper()
          .SignUp(username.text.toString(), password.text.toString(),
              email.text.toString())
          .then((value) => {
                if (value is User)
                  {
                    LoginCubit.userName = username.text,
                    LoginCubit.userEmail = value.email!,
                    print(LoginCubit.userEmail),
                    print(LoginCubit.userName),
                    email.clear(),
                    password.clear(),
                    username.clear(),
                    emit(SignUpClearTextController()),
                    emit(SignUpSuccessState()),
                  }
                else if (value is String)
                  {
                    showToast(text: value.toString(), color: Colors.red),
                    emit(SignUpErrorState()),
                  }
              });
    } else {
      print("Not Valid");
    }
  }

  void showPassword() {
    visible = !visible;
    isPassword = !isPassword;
    emit(SignUpChangePasswordIconState());
  }

  void goToLogin() {
    email.clear();
    password.clear();
    username.clear();
    emit(SignUpClearTextController());
    emit(SignUpGoToLogin());
  }
}
