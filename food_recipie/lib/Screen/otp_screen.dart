import 'package:flutter/material.dart';
import 'package:food_recipie/Auth/authentication.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import '../Theme_Style/textstyle.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key, required this.verificationId});

  final String verificationId;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late String _otpPassword;
  OtpFieldController otpFieldController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3EFCC),
      appBar: AppBar(
        backgroundColor: const Color(0xff32502E),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('Asset/homescreen.png', scale: 5),
                const SizedBox(height: 50),
                Text(
                  'Enter OTP',
                  style: bigPageStyle,
                ),
                const SizedBox(height: 30),
                OTPTextField(
                  controller: otpFieldController,
                  length: 6,
                  fieldWidth: 50,
                  width: MediaQuery.of(context).size.width,
                  fieldStyle: FieldStyle.box,
                  style: smallPageStyle,
                  onChanged: (value) {
                    _otpPassword = value;
                  },
                ),
                const SizedBox(height: 30),
                RawMaterialButton(
                    padding: const EdgeInsets.all(20),
                    fillColor: const Color(0xff32502E),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    onPressed: () {
                      verifyOTPCode(
                          context: context,
                          receivedID: widget.verificationId,
                          code: _otpPassword,
                          controller: otpFieldController);
                    },
                    child: const Text('Sign In'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
