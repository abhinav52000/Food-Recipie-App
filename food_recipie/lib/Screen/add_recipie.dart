import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_recipie/Theme_Style/decoration.dart';
import 'package:food_recipie/Theme_Style/textstyle.dart';
import 'package:food_recipie/alert/snack_bar.dart';

final _cloudauth = FirebaseFirestore.instance;

class AddRecipieScreen extends StatefulWidget {
  const AddRecipieScreen({super.key});

  static const id = "Add Recipie";

  @override
  State<AddRecipieScreen> createState() => _AddRecipieScreenState();
}

class _AddRecipieScreenState extends State<AddRecipieScreen> {
  Map<String, dynamic> recipieDetails = {
    'name': '',
    'contributor': '',
    'ingredients': '',
    'procedure': '',
    'likes': 0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3EFCC),
      appBar: AppBar(
        title: Text('Add Your Dish',
            style: homePageStyle.copyWith(color: const Color(0xffF3EFCC))),
        backgroundColor: const Color(0xff32502E),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              TextField(
                onChanged: (value) {
                  recipieDetails['name'] = value;
                },
                style: smallHomePageStyle,
                decoration: inputDecorationfortextfield(
                    labelText: 'Dish Name', context: context),
              ),
              const SizedBox(height: 30),
              TextField(
                onChanged: (value) {
                  recipieDetails['contributor'] = value;
                },
                style: smallHomePageStyle,
                decoration: inputDecorationfortextfield(
                    labelText: 'Author Name', context: context),
              ),
              const SizedBox(height: 30),
              TextField(
                onChanged: (value) {
                  recipieDetails['ingredients'] = value;
                },
                style: smallHomePageStyle,
                decoration: inputDecorationfortextfield(
                    labelText: 'Ingredients', context: context),
              ),
              const SizedBox(height: 30),
              TextField(
                onChanged: (value) {
                  recipieDetails['procedure'] = value;
                },
                style: smallHomePageStyle,
                decoration: inputDecorationfortextfield(
                    labelText: 'Procedure', context: context),
              ),
              const SizedBox(height: 50),
              RawMaterialButton(
                onPressed: () {
                  if (recipieDetails['procedure']!.length < 20) {
                    showSnackBar(
                        context: context, content: 'Fill All Fields Properly');
                  } else {
                    _cloudauth.collection('recipies').add(recipieDetails);
                    showSnackBar(context: context, content: 'Dish Is Added');
                  }
                  Navigator.pop(context);
                },
                padding: const EdgeInsets.all(25),
                fillColor: const Color(0xff32502E),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Text(
                  'Add Your Recipie',
                  style:
                      smallPageStyle.copyWith(color: const Color(0xffF3EFCC)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
