import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_market/controller/bottom_navigationbar.dart';
import 'dart:convert';

import 'package:grocery_market/screen/all_categories.dart';
import 'package:grocery_market/screen/chicken/chicken_page.dart';
import 'package:grocery_market/screen/cosmetic/cosmetic_page.dart';
import 'package:grocery_market/screen/dairy/dairy_page.dart';
import 'package:grocery_market/screen/fish/fish_page.dart';
import 'package:grocery_market/screen/fruits/fruit_page.dart';
import 'package:grocery_market/screen/groceries/groceries_page.dart';
import 'package:grocery_market/screen/meat/meat_page.dart';
import 'package:grocery_market/screen/payment_page.dart';
import 'package:grocery_market/screen/product_cart.dart';
import 'package:grocery_market/screen/product_detail.dart';
import 'package:grocery_market/screen/vegetable/vegetable_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> route=[
    MeatPage(),
    FishPage(),
    VegetablePage(),
    ChickenPage(),
    GroceriesPage(),
    DairyPage(),
    CosmeticPage(),
    FruitPage()
  ];
  List cat = [];
  List data=[];
  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("lib/json/category_list.json")
        .then((value) => setState(() {
              cat = json.decode(value);
            }));
    await DefaultAssetBundle.of(context)
        .loadString("lib/json/top_selling.json")
        .then((value) => setState(() {
      data = json.decode(value);
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    _readData();
    super.initState();
  }
  
  final BottomNavController controller=Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            height: h,
            width: w,
            color: Colors.lightBlueAccent.shade100.withOpacity(0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //appbar
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                  child: Row(
                    children: [
                      Image.asset(
                        "lib/icons/menu.png",
                        height: 35,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "Grocery",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              children: [
                            TextSpan(
                                text: "Market",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 20))
                          ])),
                      Expanded(child: Container()),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          shape: BoxShape.circle
                        ),
                        child: IconButton(
                            onPressed:(){
                              Get.to(()=>ProductCart());
                            },
                            icon:Icon(Icons.shopping_cart_outlined,size: 30,)
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                //promo card
                Container(
                  height: h * 0.15,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent.shade100.withOpacity(1),
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    children: [
                      Container(
                        width: w * 0.35,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("lib/images/image1.jpg"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                bottomLeft: Radius.circular(25))),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Choose your food",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "We collect fresh and authentic goods from root label and trusted sources for our client.",
                              style: TextStyle(
                                  fontSize: 17, color: Colors.grey.shade700),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                //categories text
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Text(
                        "Categories",
                        style: GoogleFonts.alegreya(
                            textStyle: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600)),
                      ),
                      Expanded(child: Container()),
                      Text(
                        "See All",
                        style: GoogleFonts.alegreya(
                            fontSize: 18, color: Colors.orange),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.to(()=>AllCategories());
                          }, icon: Icon(Icons.arrow_forward_ios))
                    ],
                  ),
                ),

                //category
                SizedBox(
                  height: 125,
                  child: ListView.builder(
                      itemCount: cat.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (_,index){
                        return GestureDetector(
                          onTap: (){
                            Get.to(()=>route[index]);
                          },
                          child: Container(
                            height: 125,
                            width: 170,
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                color: index.isEven ? Colors.pinkAccent.shade100.withOpacity(0.5) : Colors.lightGreen.shade200,
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
                ),

                //popular product text
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Text(
                        "Popular Products",
                        style: GoogleFonts.alegreya(
                            textStyle: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600)),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Get.to(()=>AllCategories());
                          }, icon: Icon(Icons.arrow_forward_ios))
                    ],
                  ),
                ),

                //horizontal list
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    itemCount: data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_,index){
                    return GestureDetector(
                      onTap: (){
                        Get.to(()=>ProductDetail(),arguments: {
                          'name':data[index]['item'].toString(),
                          'image':data[index]['image'].toString(),
                          'price':data[index]['new_price'].toString(),
                          'quantity':data[index]['quantity'].toString(),
                          'determiner':data[index]['determiner'].toString(),
                          'description':data[index]['description'].toString()
                        });
                      },
                      child: Container(
                        height: 220,
                        width: 180,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.black54,width: 1.5)
                        ),
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 110,
                              width: 180,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(data[index]['image']),fit: BoxFit.cover),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30)
                                  )
                              ),
                            ),
                            SizedBox(height: 8,),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data[index]['item'],style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                                  SizedBox(height: 5,),
                                  Text(data[index]['quantity']+data[index]['determiner'],style: TextStyle(fontSize: 16,color: Colors.grey.shade700),),
                                  SizedBox(height: 08,),
                                  Row(
                                    children: [
                                      Text("\$"+data[index]['new_price'],style: TextStyle(fontSize: 22,color: Colors.grey.shade900,fontWeight: FontWeight.w600),),
                                      SizedBox(width: 5,),
                                      Text("\$"+data[index]['old_price'],style: TextStyle(fontSize: 18,color: Colors.redAccent,fontWeight: FontWeight.w400,decoration: TextDecoration.lineThrough),),
                                      Expanded(child: Container()),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.redAccent.shade100.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        padding: EdgeInsets.all(5),
                                        child: Icon(Icons.add),
                                      )
                                    ],
                                  )
                                ],
                              ),
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

        bottomNavigationBar: Container(
          height: 70,
          child: GNav(
              haptic: true, // haptic feedback
              tabBorderRadius: 15,
              backgroundColor: Colors.white,
              //tabActiveBorder: Border.all(color: Colors.purple, width: 1.5), // tab button border
              curve: Curves.easeInCubic, // tab animation curves
              duration: Duration(milliseconds: 200), // tab animation duration
              color: Colors.grey[500], // unselected icon color
              activeColor: Colors.white, // selected icon and text color
              iconSize: 30, // tab button icon size
              tabBackgroundColor: Colors.deepPurple.withOpacity(0.9), // selected tab background color
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 07),
              selectedIndex: controller.selectedIndex,
              onTabChange: controller.changeIndex,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              textStyle: TextStyle(fontSize: 18,color: Colors.purple),
              tabs: [
                GButton(
                  icon: Icons.storefront_sharp,
                ),
                GButton(
                  icon: Icons.favorite_border_rounded,
                ),
                GButton(
                  icon: Icons.shopping_cart_outlined,
                  onPressed: (){
                    Get.to(()=>ProductCart());
                  },
                ),
                GButton(
                  icon: Icons.contact_page_outlined,
                ),
                GButton(
                  icon: Icons.person_outline_rounded,
                )
              ]
          ),
        ),
      ),
    );
  }
}
