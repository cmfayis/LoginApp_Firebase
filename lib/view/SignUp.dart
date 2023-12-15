// ignore_for_file: use_build_context_synchronously

import 'package:firebase_app/view/Listpage.dart';
import 'package:firebase_app/view/Login.dart';
import 'package:firebase_app/view/widgets/elevatedbutton.dart';
import 'package:firebase_app/view/widgets/sizedbox.dart';
import 'package:firebase_app/view/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signup_page extends StatelessWidget {
  const signup_page({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final namecontroller = TextEditingController();
    final emailcontroller = TextEditingController();
    final passwordcontroller = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
            const        Sizedbox(height: 15.0),
                    Container(
                        height: 250,
                        width: 329,
                        child: Image.asset("assets/images/login.png")),
              const Text(
                      'Create Acoount',
                      style: TextStyle(
                          fontSize: 37.0,
                          color: Color.fromARGB(255, 146, 227, 168),
                          fontWeight: FontWeight.w900),
                    ),
               const     SizedBox(
                      height: 50,
                    ),
                    textfield(
                      controller: namecontroller,
                      name: 'Name',
                      color:const Color.fromARGB(255, 216, 224, 231),
                    ),
                  const  Sizedbox(height: 5.0),
                    textfield(
                      controller: emailcontroller,
                      name: 'Email',
                      color:const Color.fromARGB(255, 216, 224, 231),
                    ),
              const    SizedBox(
                      height: 5,
                    ),
                    textfield(
                      controller: passwordcontroller,
                      name: 'Password',
                      color:const Color.fromARGB(255, 216, 224, 231),
                    ),
             const       SizedBox(
                      height: 20,
                    ),
                    MyElevatedButton(
                        width: 160,
                        colors: Colors.white,
                        color:const Color.fromARGB(255, 146, 227, 168),
                        buttonText: 'Sign Up',
                        onPressed: () async {
                          try {
                            UserCredential userCredential =
                                await _auth.createUserWithEmailAndPassword(
                              email: emailcontroller.text,
                              password: passwordcontroller.text,
                            );
                            
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ListPage()),
                            );

                            print(
                                'User created: ${userCredential.user!.email}');
                          } catch (e) {
                            print('Error creating user: $e');
                          }
                        }),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const login_page()));
                        },
                        child:const Text('Already have an account',style: TextStyle(color: Colors.blue),)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
