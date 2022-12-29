import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_market/home_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

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
        child: Stack(
          alignment: Alignment.center,
          children: [
            //image
            Positioned(
              top: h * 0.08,
              left: 30,
              right: 30,
              child: Image.asset(
                "lib/icons/shopping-bag.png",
                height: 310,
              ),
            ),
            //welcome text
            Positioned(
              top: h * 0.52,
              child: SizedBox(
                width: 250,
                child: Text("Welcome to our place!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                          fontSize: 32,
                          color: Colors.deepPurple.shade900.withOpacity(1),
                          fontWeight: FontWeight.w500),
                    )),
              ),
            ),
            //promo text
            Positioned(
              top: h * 0.67,
              left: 50,
              right: 50,
              child: Text(
                "We are ready to deliver the daily necessities to your door.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
              ),
            ),
            //button
            Positioned(
              top: h * 0.78,
              left: 30,
              right: 30,
              child: MaterialButton(
                onPressed: () {
                  Get.to(()=>HomeScreen());
                },
                child: Text(
                  "Lets Explore",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                color: Colors.indigo,
                height: 55,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
