import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_recipie/Screen/homescreen.dart';
import 'package:food_recipie/Screen/otp_screen.dart';
import 'package:food_recipie/alert/snack_bar.dart';
import 'package:food_recipie/save_login/login_details.dart';
import 'package:otp_text_field/otp_field.dart';

FirebaseAuth auth = FirebaseAuth.instance;

void verifyUserPhoneNumber(
    {required BuildContext context, required String phoneNumber}) {
  print(phoneNumber);
  auth.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    verificationCompleted: (PhoneAuthCredential credential) async {
      await auth.signInWithCredential(credential).then(
            (value) => print('Logged In Successfully'),
          );
    },
    verificationFailed: (FirebaseAuthException e) {
      print(e.message);
    },
    codeSent: (String verificationId, int? resendToken) {
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OTPScreen(verificationId: verificationId)));
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      print('TimeOut');
    },
  );
}

Future<void> verifyOTPCode(
    {required BuildContext context,
    required String receivedID,
    required String code,
    required OtpFieldController controller}) async {
  PhoneAuthCredential credential = PhoneAuthProvider.credential(
    verificationId: receivedID,
    smsCode: code,
  );
  try {
    await auth.signInWithCredential(credential).then((value) {
      saveMyValue(auth.currentUser.toString());
      Navigator.popAndPushNamed(context, HomeScreen.id);
    });
  } on FirebaseAuthException catch (e) {
    controller.clear();
    showSnackBar(context: context, content: e.message.toString());
  }

  // catch (e) {
  //   controller.clear();
  //   showSnackBar(context: context, content: );
  // }
}



// 8368580134