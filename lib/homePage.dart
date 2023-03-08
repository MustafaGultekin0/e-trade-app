import 'dart:ui';

import 'package:e_ticaret_app/categories.dart';
import 'package:e_ticaret_app/components/bottomNavigation.dart';
import 'package:e_ticaret_app/components/label.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFE5E4E2),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  //Baslik
                  baslik(),
                  //Banner
                  banner(),
                  //Butonlar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      navigation(
                          text: 'Kategoriler',
                          icon: Icons.menu,
                          widget: CategoriesPage(),
                          context: context
                          ), //Widget kismini duzelt
                      navigation(
                          text: 'Favoriler',
                          icon: Icons.favorite,
                          widget: banner()), //Widget kismini duzelt
                      navigation(
                          text: 'Hediyeler',
                          icon: Icons.card_giftcard,
                          widget: banner()), //Widget kismini duzelt
                      navigation(
                          text: 'En çok satanlar ',
                          icon: Icons.shop,
                          widget: banner()), //Widget kismini duzelt
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  //Sales
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'İndirimli Ürünler',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xFF0A1034)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  //Sales Items
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      salesItems(
                          text: 'Akıllı Telefonlar',
                          photoUrl: "assets/telephone.png",
                          discount: '-30%',
                          screenWidth: screenWidth - 60),
                      salesItems(
                          text: 'Laptoplar',
                          photoUrl: "assets/laptop.png",
                          discount: '-35%',
                          screenWidth: screenWidth - 60),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      salesItems(
                          text: 'Aksesuarlar',
                          photoUrl: "assets/accessories.png",
                          discount: '-50%',
                          screenWidth: screenWidth - 60),
                      salesItems(
                          text: 'Giyim',
                          photoUrl: "assets/wear.png",
                          discount: '-50%',
                          screenWidth: screenWidth - 60),
                    ],
                  ),
                  SizedBox(height: 50,)
                ],
              ),
            ),
            //BottomNavigationBar
            bottomNavigationBar("home"),
          ],
        ),
      ),
    );
  }
}

Widget baslik() {
  return Padding(
    padding: const EdgeInsets.only(top: 24),
    child: Center(
      child: Text(
        'Anasayfa',
        style: TextStyle(
            fontSize: 32, color: Color(0xFF0A1034), fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget banner() {
  return Padding(
    padding: const EdgeInsets.only(top: 24),
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 24, right: 36, top: 14, bottom: 18),
      decoration: BoxDecoration(
          color: Color(0xFF0001FC), borderRadius: BorderRadius.circular(6.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ev Hoparlörü',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                '2000 TL',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
              width: 57, height: 78, child: Image.asset('assets/speaker.png')),
        ],
      ),
    ),
  );
}

Widget navigation(
    {required String text,
    required IconData icon,
    required Widget widget,
    BuildContext? context}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context!, MaterialPageRoute(builder: (context) {
        return widget;
      }));
    },
    child: Padding(
      padding: EdgeInsets.only(top: 48),
      child: Row(
        children: [
          //ilk eleman
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 19, vertical: 22),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, //Yuvarlak yapar,
                    color: Color(0xFFE0ECF8)),
                child: Icon(
                  icon,
                  color: Color(0xFF0001FC),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                text,
                style: TextStyle(
                    color: Color(0xFF1F53E4),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ],
      ),
    ),
  );
}

Widget salesItems(
    {required String text,
    required String photoUrl,
    required String discount,
    required double screenWidth}) {
  return Container(
    width: (screenWidth - 60) * 0.5,
    padding: EdgeInsets.only(left: 12, top: 12, bottom: 21, right: 21),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label(discount),
        Center(
            child: SizedBox(
                width: 61.7, height: 130, child: Image.asset(photoUrl))),
        Center(child: Text(text))
      ],
    ),
  );
}
