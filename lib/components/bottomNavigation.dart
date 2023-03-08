import 'package:flutter/material.dart';

Widget bottomNavigationBar(String page){
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: Offset(0, -3),
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10)
      ],
        color: Color(0xFFEFF5FB),),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          navIcon(iconData: Icons.home_filled, isActive: page == "home"),
          navIcon(iconData: Icons.search, isActive: page == "search"),
          navIcon(
              iconData: Icons.shopping_bag_outlined, isActive: page == "cart"),
          navIcon(iconData: Icons.person, isActive: page == "profile"),
        ],
      ),
    ),
  );
}
Widget navIcon({required IconData iconData, required bool isActive}) {
  return Icon(
    iconData,
    size: 21,
    color: Color(isActive ? 0xFF0001FC : 0xFF0A1034),
  );
}