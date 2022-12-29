import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:grocery_market/screen/vegetable/vegetable_page.dart';
import 'chicken/chicken_page.dart';
import 'cosmetic/cosmetic_page.dart';
import 'dairy/dairy_page.dart';
import 'fish/fish_page.dart';
import 'fruits/fruit_page.dart';
import 'groceries/groceries_page.dart';
import 'meat/meat_page.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({Key? key}) : super(key: key);

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  List<Widget> route = [
    MeatPage(),
    FishPage(),
    VegetablePage(),
    ChickenPage(),
    GroceriesPage(),
    DairyPage(),
    CosmeticPage(),
    FruitPage()
  ];
  List color=[
    Colors.pinkAccent.shade100.withOpacity(0.5),
    Colors.lightGreen.shade200,
    Colors.lightGreen.shade200,
    Colors.pinkAccent.shade100.withOpacity(0.5),
    Colors.pinkAccent.shade100.withOpacity(0.5),
    Colors.lightGreen.shade200,
    Colors.lightGreen.shade200,
    Colors.pinkAccent.shade100.withOpacity(0.5),
  ];
  List cat = [];
  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("lib/json/category_list.json")
        .then((value) => setState(() {
              cat = json.decode(value);
            }));
  }

  @override
  void initState() {
    // TODO: implement initState
    _readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.home_outlined,
                size: 30,
                color: Colors.white,
              )),
          backgroundColor: Colors.cyan,
          elevation: 0,
        ),
        body: Container(
          height: h,
          width: w,
          color: Colors.greenAccent.shade100.withOpacity(0.3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 20, bottom: 10),
                child: Text(
                  "Select your categories",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 1.35),
                    itemCount: cat.length,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: (){
                          Get.to(()=>route[index]);
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 10, bottom: 10, right: 10, top: 10),
                          decoration: BoxDecoration(
                              color: color[index],
                              borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.only(right: 10, top: 10, left: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    cat[index]['icon'],
                                    height: 70,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                cat[index]['text'],
                                style: TextStyle(fontSize: 25),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
