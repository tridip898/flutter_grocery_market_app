import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_market/screen/payment_page.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.6,
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
          title: Text("Cart",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.w600),),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.share,size: 30,color: Colors.black,))
          ],
        ),
        body: Container(
          height: h,
          width: w,
          color: Colors.grey.shade100,
          child: Stack(
            children: [
              Positioned(
                bottom: 20,
                left: 13,
                right: 13,
                child: Container(
                  height: h*0.29,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 30,
                        spreadRadius: 20,
                        offset: Offset(10, 10)
                      )
                    ]
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Subtotal",style: TextStyle(fontSize: 18,color: Colors.grey.shade600),),
                          Expanded(child: Container()),
                          Text("\$480.00",style: TextStyle(fontSize: 18,color: Colors.grey.shade600),)
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Text("Charge",style: TextStyle(fontSize: 18,color: Colors.grey.shade600),),
                          Expanded(child: Container()),
                          Text("\$20.00",style: TextStyle(fontSize: 18,color: Colors.grey.shade600),)
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        height: 30,
                      ),
                      Row(
                        children: [
                          Text("Total",style: TextStyle(fontSize: 20,color: Colors.grey.shade900,fontWeight: FontWeight.w600),),
                          Expanded(child: Container()),
                          Text("\$500.00",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600, color: Colors.grey.shade900),)
                        ],
                      ),
                      SizedBox(height: 25,),
                      MaterialButton(
                        onPressed: (){
                          Get.to(()=>PaymentPage());
                        },
                        color: Colors.orange,
                        child: Text("Check Out",style: TextStyle(fontSize: 21,color: Colors.white,fontWeight: FontWeight.w500),),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        minWidth: w*0.7,
                        height: 50,
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
