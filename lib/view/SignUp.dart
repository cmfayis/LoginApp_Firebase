import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/controller/profileprovider.dart';
import 'package:firebase_app/view/Listpage.dart';
import 'package:firebase_app/view/loginpage.dart';
import 'package:firebase_app/view/widgets/custom_textfield.dart';
import 'package:firebase_app/view/widgets/mainpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpWrapper extends StatelessWidget {
  const SignUpWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignUpPage();
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formkey = GlobalKey<FormState>();
  final namecontroller1 = TextEditingController();
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final phonecontoller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 203, 192, 192),),
      body: Form(
        key: formkey,
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 203, 192, 192),
                Color.fromARGB(255, 25, 25, 25),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1300),
                      child: const Text(
                        "Create an Account!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 40,
                          ),
                          FadeInUp(
                            duration: const Duration(milliseconds: 1400),
                            child: Column(
                              children: <Widget>[
                                CustomTextFormField(
                                  controller: namecontroller,
                                  labelText: 'First Name',
                                  hintText: 'First Name',
                                  validator: nameValidate,
                                  icons: const Icon(Icons.person),
                                ),
                                SizedBox(height: 20,),
                                CustomTextFormField(
                                  controller: emailcontroller,
                                  labelText: 'Email',
                                  hintText: 'Email',
                                  validator: nameValidate,
                                  icons: const Icon(Icons.person),
                                ),
                                SizedBox(height: 20,),
                                CustomTextFormField(
                                  controller: passwordcontroller,
                                  labelText: 'Password',
                                  hintText: 'Password ',
                                  validator: nameValidate,
                                  icons: const Icon(Icons.person),
                                ),
                                SizedBox(height: 20,),
                                CustomTextFormField(
                                  controller: phonecontoller,
                                  labelText: 'Phone',
                                  hintText: 'Phone',
                                  validator: nameValidate,
                                  icons: const Icon(Icons.person),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          FadeInUp(
                            duration: const Duration(milliseconds: 1500),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Existing account ? ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginPage(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Log in',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 23,
                          ),
                          FadeInUp(
                            duration: const Duration(milliseconds: 1600),
                            child: MaterialButton(
                              onPressed: () async {
                                try {

                                  UserCredential userCredential =
                                      await _auth.createUserWithEmailAndPassword(
                                    email: emailcontroller.text,
                                    password: passwordcontroller.text,
                                  );
                                  FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(userCredential.user!.uid)
                                      .set({
                                    'name': namecontroller.text,
                                    "email": emailcontroller.text,
                                  });
                                  Provider.of<ProfileProvider>(context,
                                          listen: false)
                                      .getUserData();

                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MainPage(),
                                    ),
                                    (routes) => false,
                                  );

                                  print(
                                      'User created: ${userCredential.user!.email}');
                                } catch (e) {
                                  print('Error creating user: $e');
                                }
                              },
                              height: 50,
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Center(
                                child: Text(
                                  "SignUp",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
