import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.green,
        child: Column(
          children: [
            const Spacer(),
            const SizedBox(height: 30),
            Image.asset("assets/images/food1.png", height: 250),
            const SizedBox(height: 20),
            const Text(
              "Fast Delivery at\nyour doorstop",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Home delivery and online reservation\nsystem for restaurant and cafe",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Get.offAndToNamed("/");
              },
              child: Container(
                width: double.infinity,
                height: 55,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Let's Explore",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
