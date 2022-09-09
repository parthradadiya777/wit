import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../loginpage/loginpage.dart';

class AuthMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signUpUser({
    required String name,
    required String email,
    required String number,
    required String passsword,
  }) async {
    String res = 'Some erro Occurred';
    try {
      if (name.isNotEmpty || email.isNotEmpty || passsword.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email.trim(), password: passsword);
        print(cred.user!.uid);
        await _firestore.collection('user').doc(cred.user!.uid).set({
          'name': name,
          'email': email.trim(),
          'password': passsword,
        });
        res = 'Success';
        Get.to(() => LoginView());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: 'User Already Exist.');
        // Get.to(()=>SignUpPageView());
      }
    }
    return res;
  }

// Logg in

  Future<String> logginUser({
    required String email,
    required String passsword,
  }) async {
    String res = 'Some erro Occurred';
    try {
      if (email.isNotEmpty || passsword.isNotEmpty) {
        UserCredential? cred = await _auth.signInWithEmailAndPassword(
            email: email.trim(), password: passsword);
        print(cred.user!.uid);

        res = 'Success';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'User Not exist .');
        //  Get.to(()=> SignUpPageView());
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'Wrong password please check password');
      } else if (e.code == 'invalid-email') {
        Fluttertoast.showToast(msg: 'Please Check Email Format');
      }
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}