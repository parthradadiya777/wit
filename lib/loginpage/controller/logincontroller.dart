import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wit_project/homepage/homepage.dart';

import '../../const/color.dart';
import '../../signuppage/authfile.dart';


class LoginController extends GetxController {
  //TODO: Implement LoginController

//  HomeController homeController = Get.find<HomeController>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
//  final storage = new FlutterSecureStorage();
 final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  var name;
  var number;
  var emailid;
  var id;

  @override
  void onClose() {}

  void increment() => count.value++;




  void logginauth() async {
    String res = await AuthMethod()
        .logginUser(email: email.text, passsword: password.text);

    if (res == 'Success') {
      //  Get.to(()=> BottomNavigationBarView());
      Get.offAll(HomePage());
   //   if (logcre != null) logcre!.setString('token', res);

      print(res);
      email.clear();
      password.clear();

    } else {
      print('something went worng');
      print(res);
    }
  }
}

class CustomFullScreenDialog {
  static void showDialog() {
    Get.dialog(
      WillPopScope(
        child: Container(
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(textColor),
            ),
          ),
        ),
        onWillPop: () => Future.value(false),
      ),
      barrierDismissible: false,
      barrierColor: Color(0xff141A31).withOpacity(.3),
      useSafeArea: true,
    );
  }

  static void cancelDialog() {
    Get.back();
  }
}