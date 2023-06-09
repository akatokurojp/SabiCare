import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgorPage extends StatefulWidget {
  const ForgorPage({Key? key}) : super(key: key);

  @override
  State<ForgorPage> createState() => _ForgorPage();
}

class _ForgorPage extends State<ForgorPage> {
  final TextEditingController forgoremailController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    forgoremailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: forgoremailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content:
                  Text('Password Reset Link has been Sent! Check your E-Mail'),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Center(
                child: SingleChildScrollView(
                    child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.phone_android,
              size: 100,
            ),
            //Hello again!
            const Text(
              'Hello again !',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome Back !',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //email textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    controller: forgoremailController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                    ),
                  ),
                ),
              ),
            ),
            MaterialButton(
              onPressed: passwordReset,
              color: Colors.deepPurple[200],
              child: const Text('Reset Password'),
            ),

            //password textfield
            const SizedBox(
              height: 10,
            )
          ],
        )))));
  }
}
