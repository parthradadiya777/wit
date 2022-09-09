import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';

import '../const/color.dart';
import '../loginpage/loginpage.dart';
import 'authfile.dart';


class SignUpPageView extends StatefulWidget {
  const SignUpPageView({Key? key}) : super(key: key);

  @override
  State<SignUpPageView> createState() => _SignUpPageViewState();
}

class _SignUpPageViewState extends State<SignUpPageView> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();
  final _form = GlobalKey<FormState>();
  bool verify = false;
  @override
  Widget build(BuildContext context) {
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
                          child: Column(
                            children: [
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
                              ), //120
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
                                        width: 70.vw,
                                        alignment: Alignment.center,
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
                              ), //60
                              SizedBox(
                                height: 30,
                              ), //for app name and tag  line
                              Container(
                                //  padding: EdgeInsets.all(10),
                                height: 600,
                                width: 70.vw,
                                //color: Colors.yellow,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Name is require';
                                        }
                                        return null;
                                      },
                                      controller: name,
                                      decoration: InputDecoration(
                                        icon: Icon(
                                          Icons.person,
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
                                        hintText: 'User Name',
                                      ),
                                    ),

                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Email is require';
                                        } else if (!RegExp(
                                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                            .hasMatch(value)) {
                                          return "Please enter a valid email address";
                                        }
                                        return null;
                                      },
                                      controller: email,
                                      decoration: InputDecoration(
                                        icon: Icon(
                                          Icons.email,
                                          color: Colors.blueGrey,
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(15)),
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
                                      validator: (v) {
                                        if (v!.isEmpty) {
                                          return 'Password is require';
                                        } else if (v.length < 7) {
                                          return 'Password must be grater than 7';
                                        }
                                      },
                                      controller: password,
                                      decoration: InputDecoration(
                                        //   errorTextPresent: false,
                                        icon: Icon(Icons.key),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(15)),
                                        hintText: 'Password',
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                              color: textColor,
                                              width: 3,
                                            )),
                                      ),
                                      obscureText: true,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.done,
                                          color: textColor,
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 30, right: 30),
                                            child: InkWell(
                                              onTap: () async {
                                                if (_form.currentState!
                                                    .validate()) {
                                                  await AuthMethod().signUpUser(
                                                    name: name.text,
                                                    email: email.text.trim(),
                                                    number: number.text,
                                                    passsword: password.text,
                                                  );
                                                } else {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                      ' Please Verify Number');
                                                }
                                              },
                                              child: Container(
                                                margin:
                                                EdgeInsets.only(right: 0),
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
                                                        'Sign Up',
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
                                            Container(
                                              width: 60.vw,
                                              child: FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Text(
                                                    'Already have an Account?'),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Get.off(LoginView());
                                              },
                                              child: Container(
                                                width: 20.vw,
                                                height: 30,
                                                child: FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Text(
                                                    'Sign In',
                                                    style: TextStyle(
                                                        color: textColor,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ), //300

                              //30
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
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