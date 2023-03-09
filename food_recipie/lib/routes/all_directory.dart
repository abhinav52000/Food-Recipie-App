import 'package:flutter/material.dart';
import 'package:food_recipie/Screen/add_recipie.dart';
import 'package:food_recipie/Screen/homescreen.dart';
import 'package:food_recipie/Screen/login_registration.dart';
import 'package:food_recipie/Screen/spalshscreen.dart';

Map<String, Widget Function(BuildContext)> allscreenroute = {
  SplashScreen.id: (context) => const SplashScreen(),
  LoginRegistration.id: (context) => const LoginRegistration(),
  HomeScreen.id: (context) => const HomeScreen(),
  AddRecipieScreen.id: (context) => const AddRecipieScreen(),
};
