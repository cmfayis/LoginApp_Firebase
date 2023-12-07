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
                    Sizedbox(height: 15.0),
                    Container(
                        height: 250,
                        width: 329,
                        child: Image.asset("assets/images/login.png")),
                    Text(
                      'Create Acoount',
                      style: TextStyle(
                          fontSize: 37.0,
                          color: Color.fromARGB(255, 146, 227, 168),
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    textfield(
                      controller: namecontroller,
                      name: 'Name',
                      color: Color.fromARGB(255, 216, 224, 231),
                    ),
                    Sizedbox(height: 5.0),
                    textfield(
                      controller: emailcontroller,
                      name: 'Email',
                      color: Color.fromARGB(255, 216, 224, 231),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textfield(
                      controller: passwordcontroller,
                      name: 'Password',
                      color: Color.fromARGB(255, 216, 224, 231),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyElevatedButton(
                        width: 160,
                        colors: Colors.white,
                        color: Color.fromARGB(255, 146, 227, 168),
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
                                  builder: (context) => List_page()),
                            );

                            print(
                                'User created: ${userCredential.user!.email}');
                          } catch (e) {
                            print('Error creating user: $e');
                          }
                        }),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>login_page()));
                        },
                        child: Text('Already have an account',style: TextStyle(color: Colors.blue),)),
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
