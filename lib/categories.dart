import 'package:e_ticaret_app/category.dart';
import 'package:e_ticaret_app/components/header.dart';
import 'package:flutter/material.dart';

import 'components/bottomNavigation.dart';

class CategoriesPage extends StatelessWidget {
  final List<String> categories = [
    "Hepsi",
    "Bilgisayarlar",
    "Aksesuarlar",
    "Akıllı telefonlar",
    "Akıllı nesneler",
    "Mikrofonlar",
    "Hoparlörler",
    "Giyim",
    "Parfümler",
    "Bebek ürünleri",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE5E4E2),
        body: SafeArea(
            child: Stack(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            // Header
            header('Kategoriler', context),
            SizedBox(
              height: 16,
            ),
            // Kategoriler
            Expanded(
              child: ListView(
                  children:
                      categories.map((String title) => category(title,context)).toList()),
            ),
                SizedBox(height: 50,),
          ]),
      ),

          //Bottom navigation
          bottomNavigationBar("search"),
    ],
            )));
  }
}

Widget category(String title,context) {
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return categoryPage(title);
      }));
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(24.0),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: Offset(0, 4))
          ]),
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 18, color: Color(0xFF0A1034)),
      ),
    ),
  );
}
