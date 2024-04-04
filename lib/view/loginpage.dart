import 'package:firebase_app/view/Listpage.dart';
import 'package:firebase_app/view/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(18.10),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/images/signin.png',
                  height: 300,
                  width: 300,
                ),
                const Text(
                  'Welcome Back!',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 22.0,
                ),
                TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                      hintText: ' Enter Your Email',
                      labelText: " Email",
                      prefixIcon: const Icon(
                        Icons.email_rounded,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                      hintText: 'Enter Your Password',
                      labelText: "Password",
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Signup()));
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "'Don't have an account?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "SignUp",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                MaterialButton(
                  onPressed: () async {
                    try {
                      UserCredential userCredential =
                          await _auth.signInWithEmailAndPassword(
                        email: emailcontroller.text,
                        password: passwordcontroller.text,
                      );

                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                        return const ListPage();
                      }), (routes) => false);

                      // print('User signed in: ${userCredential.user!.email}');
                    } catch (e) {
                      print('Error signing in: $e');
                    }
                  },
                  height: 50,
                  color: const Color.fromARGB(255, 215, 213, 213),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const Text(
                  "...",
                  style: TextStyle(fontSize: 50, color: Colors.black),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
