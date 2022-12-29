import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_market/controller/product_increment_decrement_controller.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({Key? key}) : super(key: key);

  final ProductIncDecController controller=Get.put(ProductIncDecController());

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: h,
          width: w,
          color: Colors.white,
          padding: EdgeInsets.only(left: 20, right: 20, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //appbar
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  Expanded(child: Container()),
                  Icon(
                    Icons.more_vert,
                    size: 30,
                  )
                ],
              ),
              //product image
              Container(
                height: h * 0.28,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Get.arguments['image']),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: h * 0.03,
              ),
              //item name
              Text(
                Get.arguments['name'],
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              //price
              Text(
                "\$"+Get.arguments['price'],
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
              ),
              Divider(
                color: Colors.grey.shade500,
                thickness: 1.1,
                height: 30,
              ),
              //counter
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.redAccent.shade100.withOpacity(0.3),
                        shape: BoxShape.circle),
                    child: IconButton(onPressed: () {
                      controller.countIncrement();
                    }, icon: Icon(Icons.add)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Obx(() => Text("${controller.count}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)),
                      Text(
                        Get.arguments['determiner'],
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.redAccent.shade100.withOpacity(0.3),
                        shape: BoxShape.circle),
                    child:
                        IconButton(onPressed: () {
                          controller.countDecrement();
                        }, icon: Icon(Icons.remove)),
                  )
                ],
              ),

              Divider(
                color: Colors.grey.shade500,
                thickness: 0.07,
                height: 30,
              ),
              Text(
                "Product Description",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 07,
              ),
              //description
              Text(
                Get.arguments['description'],
                style: TextStyle(fontSize: 15, color: Colors.grey.shade900),
              ),
              SizedBox(height: 10,),
              Text(
                "Related Products",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          width: w*0.9,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Text("Add to Cart",style: TextStyle(fontSize: 22,color: Colors.grey.shade50,fontWeight: FontWeight.w600),),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
