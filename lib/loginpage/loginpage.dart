import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';
import 'package:wit_project/signuppage/signuppage.dart';

import '../const/color.dart';
import 'controller/logincontroller.dart';


class LoginView extends GetView<LoginController> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginController());
  //  Get.lazyPut(() => HomeController());
    return Resize(
      builder: () {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: LayoutBuilder(
              builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Center(
                        child: Form(
                          key: _form,
                          child: Column(children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: textColor,
                                //    border: Border.all(),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Container(
                                  width: 15.vh,
                                  height: 15.vh,
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text('W I T',style: TextStyle(color: Colors.white),)
                                    // child: Text(
                                    //   'V L X',
                                    //   style: TextStyle(
                                    //     color: white,
                                    //     fontWeight: FontWeight.bold,
                                    //   ),
                                    // ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ), //for logo and text
                            Container(
                              height: 50,
                              width: 80.vw,
                              //  color: Colors.yellow,
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 80.vw,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          'Exchange . Auction . Buy . Sell . Rent',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: textColor),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 70.vw,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          'WASH IN TIME PRIVATE LIMITED',
                                          style: TextStyle(color: textColor),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 250,
                              width: 70.vw,
                              child: Column(
                                children: [
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }
                                      // using regular expression
                                      else if (!RegExp(
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                          .hasMatch(value.trimRight())) {
                                        return "Please enter a valid email address";
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    controller: controller.email,
                                    decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.mail_outline,
                                        color: textColor,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                            color: textColor,
                                            width: 3,
                                          )),
                                      hintText: 'Email',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: controller.password,
                                    validator: (value) {
                                      if (value!.length <= 5) {
                                        return "Please Enter valid length";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        icon: Icon(
                                          Icons.key_outlined,
                                          color: textColor,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                              color: textColor,
                                              width: 3,
                                            )),
                                        hintText: 'Password'),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.done),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 30, right: 20),
                                          child: InkWell(
                                            onTap: () async {
                                              if (_form.currentState!
                                                  .validate()) {
                                                controller.logginauth();
                                              }
                                              //  Get.to(()=>BottomNavigationBarView());
                                            },

                                            child: Container(
                                              width: 35.vw,
                                              height: 12.vw,

                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: textColor),
                                                borderRadius:
                                                BorderRadius.circular(
                                                  15,
                                                ),
                                                color: textColor,
                                              ),
                                              child: Center(
                                                child: Container(
                                                  width: 15.vw,
                                                  child: FittedBox(
                                                    fit: BoxFit.fitWidth,
                                                    child: Text(
                                                      'Sign In',
                                                      style: TextStyle(
                                                        color: white,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 30,
                              width: 80.vw,
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Row(
                                  children: [
                                    Text('Dont have an Account?'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(SignUpPageView());
                                      },
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                            color: textColor, fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 30,
                              width: 70.vw,
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                            'By Proceeding you also agree to '),
                                        Text(
                                            ' the Term of Service and Privacy Policy'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ]),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}