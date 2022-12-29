import 'dart:convert';
import 'package:get/get.dart';
import 'package:grocery_market/screen/product_detail.dart';
import 'package:flutter/material.dart';

import '../product_cart.dart';

class FruitPage extends StatefulWidget {
  const FruitPage({Key? key}) : super(key: key);

  @override
  State<FruitPage> createState() => _FruitPageState();
}

class _FruitPageState extends State<FruitPage> {

  List fruit = [];
  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("lib/json/fruit.json")
        .then((value) => setState(() {
      fruit = json.decode(value);
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: MaterialButton(
          onPressed: (){
            Get.to(()=>ProductCart());
          },
          height: 75,
          minWidth: 60,
          color: Colors.deepPurple.shade900.withOpacity(1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          child: Image.asset("lib/icons/option.png",height: 40,color: Colors.white,),
        ),
        bottomNavigationBar: Container(
          height: 50,
          width: w*0.9,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                  image: AssetImage("lib/images/bottom_back.jpg"),
                  fit: BoxFit.cover)),
        ),
        body: Container(
          height: h,
          width: w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //top heading
              Container(
                height: h * 0.25,
                decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage("lib/images/fruit_back.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 15,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300.withOpacity(0.2),
                              shape: BoxShape.circle),
                          child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                size: 30,
                                color: Colors.white,
                              ))),
                    ),
                    Positioned(
                      top: h * 0.16,
                      left: 25,
                      child: Text(
                        "Fruits",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),

              //grid
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.8),
                    itemCount: fruit.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => ProductDetail(), arguments: {
                            'name': fruit[index]['item'].toString(),
                            'image': fruit[index]['image'].toString(),
                            'price': fruit[index]['new_price'].toString(),
                            'quantity': fruit[index]['quantity'].toString(),
                            'determiner': fruit[index]['determiner'].toString(),
                            'description': fruit[index]['description'].toString()
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: Colors.black54, width: 1.5)),
                          margin: EdgeInsets.only(
                              left: 10, right: 10, bottom: 10, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 110,
                                width: 180,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(fruit[index]['image']),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30))),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15, bottom: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      fruit[index]['item'],
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      fruit[index]['quantity']+fruit[index]['determiner'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey.shade700),
                                    ),
                                    SizedBox(
                                      height: 08,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "\$" + fruit[index]['new_price'],
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.grey.shade900,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "\$" + fruit[index]['old_price'],
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.redAccent,
                                              fontWeight: FontWeight.w400,
                                              decoration:
                                              TextDecoration.lineThrough),
                                        ),
                                        Expanded(child: Container()),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.redAccent.shade100
                                                  .withOpacity(0.3),
                                              borderRadius:
                                              BorderRadius.circular(10)),
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
    );
  }
}
