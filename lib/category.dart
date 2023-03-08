import 'package:e_ticaret_app/components/bottomNavigation.dart';
import 'package:e_ticaret_app/components/header.dart';
import 'package:e_ticaret_app/productDetail.dart';
import 'package:flutter/material.dart';

class categoryPage extends StatelessWidget {

  String categoryTitle;
  categoryPage(this.categoryTitle);

  List<Map> products = [
    {
      "isim": "Macbook pro mg1",
      "fotograf": "assets/laptops/macbook1.png",
      "fiyat": "999"
    },
    {
      "isim": "Macbook air mg2",
      "fotograf": "assets/laptops/macbook2.png",
      "fiyat": "999"
    },
    {
      "isim": "Huawei mg1",
      "fotograf": "assets/laptops/huawei3.png",
      "fiyat": "999"
    },
    {
      "isim": "Huawei mg2",
      "fotograf": "assets/laptops/huawei2.png",
      "fiyat": "999"
    },
    {
      "isim": "Lenovo Legion mg1",
      "fotograf": "assets/laptops/lenovo1.png",
      "fiyat": "999"
    },
    {
      "isim": "Lenovo Legion mg2",
      "fotograf": "assets/laptops/lenovo3.png",
      "fiyat": "999"
    },
    {
      "isim": "Asus mg1",
      "fotograf": "assets/laptops/asus1.png",
      "fiyat": "999"
    },
    {
      "isim": "Asus mg2",
      "fotograf": "assets/laptops/asus2.png",
      "fiyat": "999"
    },
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
              //header
              header(categoryTitle, context),
              SizedBox(
                height: 32,
              ),
              //icerik

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  children: products.map((Map product) {
                    return buildContent(
                        product["isim"], product["fotograf"], product["fiyat"],context);
                  }).toList(),
                ),
              )
            ],
          )),
              //Bottom Navigation Bar
              bottomNavigationBar("search"),
    ])));
  }
}

Widget buildContent(String title, String photoUrl, String price,context) {
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return productDetailPage(title);
      }));
    },
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 24,
                offset: Offset(0, 16))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            photoUrl,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Color(0xFF0A1034),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '$price TL',
                style: TextStyle(
                    color: Color(0xFF0001FC),
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ],

      ),
    ),
  );
}
