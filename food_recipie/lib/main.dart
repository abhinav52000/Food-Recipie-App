import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_recipie/Screen/homescreen.dart';
import 'package:food_recipie/routes/all_directory.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screen/spalshscreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? loginData = preferences.getString('value');
  runApp(MyApp(logInStatus: (loginData == null) ? false : true));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.logInStatus});

  final bool logInStatus;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: const Color(0xff064635)),
      debugShowCheckedModeBanner: false,
      initialRoute: logInStatus ? HomeScreen.id : SplashScreen.id,
      routes: allscreenroute,
    );
  }
}
