import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../app.dart';
import '../components/app_background.dart';
import '../utils/local_store.dart';
import '../utils/my_theme.dart';
import '../utils/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await FetchDataFromLocalStore().userData();
      App.token = App.user.apiToken ?? '';
      log("token>>${App.user.apiToken}");
      await checkAlreadyLogged();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/splashlogo.png", width: Get.width * 0.35,
                // height: Get.height * 0.35,
              ),
              //    SizedBox(height: Get.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "real".toUpperCase(),
                    style: MyTheme.regularTextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: Get.height * 0.037,
                    ),
                  ),
                  Text(
                    "\ pro".toUpperCase(),
                    style: MyTheme.regularTextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: Get.height * 0.037,
                        color: Colors.yellow),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.yellow,
                    height: Get.height * 0.0018,
                    width: Get.width * 0.05,
                  ),
                  Text(
                    "\ a l l i a n c e ".toUpperCase(),
                    style: MyTheme.regularTextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: Get.height * 0.020,
                    ),
                  ),
                  Container(
                    color: Colors.yellow,
                    height: Get.height * 0.0018,
                    width: Get.width * 0.05,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
Future<void> checkAlreadyLogged() async {
  await Future.delayed(const Duration(milliseconds: 1400));

  if (App.token.isNotEmpty) {
    Get.offAllNamed(Routes.login);
  } else {
    Get.offAllNamed(Routes.login);
  }
}
