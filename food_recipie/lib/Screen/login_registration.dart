import 'package:flutter/material.dart';
import 'package:food_recipie/Auth/authentication.dart';
import 'package:food_recipie/Theme_Style/decoration.dart';
import 'package:food_recipie/Theme_Style/textstyle.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginRegistration extends StatefulWidget {
  const LoginRegistration({super.key});

  static const id = 'Login Registration Screen';

  @override
  State<LoginRegistration> createState() => _LoginRegistrationState();
}

class _LoginRegistrationState extends State<LoginRegistration> {
  late String _phoneNumber;

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
                  'Get Started',
                  style: bigPageStyle,
                ),
                const SizedBox(height: 50),
                IntlPhoneField(
                  style: smallPageStyle,
                  dropdownTextStyle: smallPageStyle,
                  dropdownIcon:
                      const Icon(Icons.arrow_drop_down, color: Colors.black),
                  decoration: inputDecorationfortextfield(
                      labelText: 'Phone Number', context: context),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    _phoneNumber = phone.completeNumber;
                  },
                ),
                const SizedBox(height: 30),
                RawMaterialButton(
                    padding: const EdgeInsets.all(20),
                    fillColor: const Color(0xff32502E),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    onPressed: () {
                      verifyUserPhoneNumber(
                          context: context, phoneNumber: _phoneNumber);
                    },
                    child: const Text('Send OTP'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
