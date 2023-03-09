import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_recipie/Auth/authentication.dart';
import 'package:food_recipie/Screen/add_recipie.dart';
import 'package:food_recipie/Screen/spalshscreen.dart';
import 'package:food_recipie/Theme_Style/textstyle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _cloudauth = FirebaseFirestore.instance;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> currentRecipieCount = [];

  @override
  void initState() {
    super.initState();
    isUserLoggedIn();
  }

  isUserLoggedIn() {
    print('my value is ${auth.currentUser}');

    if (auth.currentUser == null) {
      Navigator.popAndPushNamed(context, SplashScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3EFCC),
      appBar: AppBar(
        backgroundColor: const Color(0xff32502E),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddRecipieScreen.id);
              },
              icon: Image.asset(
                'Asset/addfoodicon.png',
              )),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: StreamBuilder<QuerySnapshot>(
            stream: (_cloudauth
                .collection('recipies')
                .orderBy('likes', descending: true)
                .snapshots()),
            builder: (context, streamsnapshot) {
              if (streamsnapshot.hasError) {
                return Center(
                    child: Text('Unable To load Data', style: bigPageStyle));
              }

              if (streamsnapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                );
              }
              final currentRecipie = streamsnapshot.data!.docs;
              currentRecipieCount.clear();
              for (int i = 0; i < currentRecipie.length; ++i) {
                currentRecipieCount.add(i);
              }

              return CarouselSlider(
                options: CarouselOptions(
                    viewportFraction: 1,
                    padEnds: false,
                    height: MediaQuery.of(context).size.height + 50,
                    scrollDirection: Axis.vertical,
                    enableInfiniteScroll: false,
                    reverse: false),
                items: currentRecipieCount.map((i) {
                  return Builder(builder: (BuildContext context) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Align(
                        //   alignment: Alignment.topRight,
                        //   child: IconButton(
                        //     onPressed: () {
                        //       _cloudauth.collection('recipies').doc('') add(data)
                        //     },
                        //     icon: const Icon(
                        //       Icons.favorite,
                        //       color: Colors.red,
                        //     ),
                        //   ),
                        // ),
                        Image.network(
                          "image url yha likhna hai ",
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.green,
                              ),
                            );
                          },
                          cacheHeight: MediaQuery.of(context).size.height ~/ 3,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset('Asset/homescreen.png');
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text('Dish Name: ${currentRecipie[i]['name']}',
                              style: homePageStyle),
                        ),
                        const SizedBox(height: 20),
                        Text('Author:  ${currentRecipie[i]['contributor']}',
                            style: smallHomePageStyle),
                        const SizedBox(height: 20),
                        Text(
                            'Ingredients:\n${currentRecipie[i]['ingredients']}',
                            style: smallHomePageStyle),
                        const SizedBox(height: 20),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                                'Procedure:\n ${currentRecipie[i]['procedure']}',
                                style: smallHomePageStyle),
                          ),
                        ),
                      ],
                    );
                  });
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
