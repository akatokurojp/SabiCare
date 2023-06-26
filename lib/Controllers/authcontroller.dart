import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sabicare/home.dart';
import '../Login.dart';

class AuthController extends GetxController {
  // sign up text editing controllers
  RxString userName = RxString('');
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  // login text editing controllers
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  //Text MSG Controller API
  final TextEditingController textController = TextEditingController();
  // Biometric scan
  LocalAuthentication auth = LocalAuthentication();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> createAccount() async {
    if (passwordConfirmed()) {
      final user = await _auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      final firestore = FirebaseFirestore.instance;
      firestore.collection('users').doc(user.user!.uid).set(
          {"email": emailController.text, "password": passwordController.text});
      if (user != null) {
        Get.to(const LoginPage());
      } else {
        print('error');
      }
    }
  }

  Future<void> loginUser() async {
    final user = await _auth.signInWithEmailAndPassword(
        email: loginEmailController.text,
        password: loginPasswordController.text);
    if (user != null) {
      // lets save user with shared prefrences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("userID", user.user!.uid);
      print(user.user!.uid);
      Get.to(const HomePage());
    } else {
      print('error');
    }
  }

  // Let's make a function for logout

  Future<void> logoutUser() async {
    await _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAll(const LoginPage());
  }

  bool passwordConfirmed() {
    if (passwordController.text.trim() ==
        confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> getUserName() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var userId = user.uid;
      var userDoc = FirebaseFirestore.instance.collection('Users').doc(userId);

      try {
        var snapshot = await userDoc.get();
        var name = snapshot.data()!['UserName'].toString();

        // Update the userName value
        userName.value = name;
      } catch (e) {
        print('Error fetching user name: $e');
      }
    }
  }
}
