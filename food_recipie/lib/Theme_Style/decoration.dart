import 'package:flutter/material.dart';

import 'textstyle.dart';

OutlineInputBorder registraionpagetilesborder = const OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(
      10,
    ),
  ),
  borderSide: BorderSide(
    color: Color(0xff32502E),
    width: 0,
  ),
);

InputDecoration inputDecorationfortextfield(
        {required String labelText, required BuildContext context}) =>
    InputDecoration(
      focusedBorder: registraionpagetilesborder,
      enabledBorder: registraionpagetilesborder,
      labelStyle: bigPageStyle,
      hintStyle: smallPageStyle,
      labelText: labelText,
      constraints: const BoxConstraints.tightFor(width: 500),
    );
