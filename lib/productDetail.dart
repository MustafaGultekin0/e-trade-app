import 'package:e_ticaret_app/components/header.dart';
import 'package:e_ticaret_app/components/label.dart';
import 'package:flutter/material.dart';

import 'components/bottomNavigation.dart';

class productDetailPage extends StatefulWidget {
  final String productTitle;

  productDetailPage(this.productTitle);

  @override
  State<productDetailPage> createState() => _productDetailPageState();
}

class _productDetailPageState extends State<productDetailPage> {
  Color? selectedColor;
  int selectedCapacity = 64;
  List<Color> colors = [
    Color(0xFF52514F),
    Color(0xFF0001FC),
    Color(0xFF6F7972),
    Color(0xFFF5D8C0)
  ];
  List<int> capacities = [64, 128, 256, 512];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E4E2),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(widget.productTitle, context),
                  SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //New yazisi
                        label("New"),
                        SizedBox(
                          height: 10,
                        ),
                        //Fotograf
                        Center(child: Image.asset("assets/telephone.png")),
                        SizedBox(
                          height: 5,
                        ),
                        //Renk secenekleri
                        Text(
                          "Color",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Color(0xFF0A1034)),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: colors
                                .map((Color color) => colorOption(
                                    color: color,
                                    selected: selectedColor == color,
                                    onTap: () {
                                      setState(() {
                                        selectedColor = color;
                                      });
                                    }))
                                .toList()),
                        SizedBox(
                          height: 20,
                        ),
                        //Kapasite secenekleri
                        Text(
                          "Capacities",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Color(0xFF0A1034)),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: capacities
                              .map((int number) => capacityOption(
                                  capacity: number,
                                  selected: selectedCapacity == number,
                                  onTap: () {
                                    setState(() {
                                      selectedCapacity == number;
                                    });
                                  }))
                              .toList(),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //Sepete Ekle Butonu
                        GestureDetector(
                          onTap: (){
                            print('Urun sepete eklendi');
                            print('Urun ismi : ' + widget.productTitle);
                            print('Urun rengi : '+ selectedColor!.value.toString());
                            print('Urun kapasitesi : ' + selectedCapacity.toString());
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: Color(0xFF1F53E4)),
                            child: Text(
                              "Add to cart",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(height: 100,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar("search"),
          ],

        ),
      ),
    );
  }
}

Widget colorOption({required Color color, selected, required Function onTap}) {
  return GestureDetector(
    onTap: onTap(),
    child: Container(
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border:
              Border.all(color: Color(0xFF0001FC), width: selected ? 5 : 0)),
      width: 23,
      height: 23,
    ),
  );
}

Widget capacityOption(
    {required int capacity, required bool selected, required Function onTap}) {
  return GestureDetector(
    onTap: onTap(),
    child: Text(
      "$capacity GB",
      style: TextStyle(
          color: Color(selected ? 0xFF0001FC : 0xFFA7A9BE), fontSize: 16),
    ),
  );
}
