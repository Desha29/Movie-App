import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app/controller/auth/login_controller.dart';

import '../../../../core/constant/routes.dart';

class FireBaseHelper {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future SignIn(String email, String password) async {
    try {
      UserCredential response = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (response.user != null) {
        LoginImp.userName = response.user!.displayName.toString();
        LoginImp.userEmail = response.user!.email.toString();

        return response.user;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return ('No user found for that email');
      } else if (e.code == 'wrong-password') {
        return ('Wrong password provided for that user');
      } else if (e.code == 'invalid-credential') {
        return ('your email or password is wrong');
      } else {
        return ('Error: ${e.code}');
      }
    }
  }

  Future SignOut() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    await auth.signOut();

    googleSignIn.disconnect();
    Get.offAllNamed(AppRoutes.login);
  }

  Future SignUp(String username, String password, String email) async {
    try {
      UserCredential response = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await response.user!.updateDisplayName(username);
      await response.user!.reload();
      LoginImp.userName = username.toString();
      LoginImp.userEmail = response.user!.email.toString();
      return response.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return ('The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        return ('The account already exists for that email');
      } else {
        return ('Error: ${e.code}');
      }
    } catch (e) {
      return ('Error: $e');
    }
  }

  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    LoginImp.userName = googleUser!.displayName.toString();
    LoginImp.userEmail = googleUser!.email.toString();
    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Get.offAllNamed(AppRoutes.home);
  }
}
