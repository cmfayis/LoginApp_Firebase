import 'package:firebase_app/view/Listpage.dart';
import 'package:firebase_app/view/SignUp.dart';
import 'package:firebase_app/view/widgets/elevatedbutton.dart';
import 'package:firebase_app/view/widgets/notification.dart';
import 'package:firebase_app/view/widgets/sizedbox.dart';
import 'package:firebase_app/view/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class login_page extends StatelessWidget {
  const login_page({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final emailcontroller = TextEditingController();
    final passwordcontroller = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 300,
                    width: 379,
                    child: Image.asset("assets/images/login.png")),
                const  Text(
                    'Login Here',
                    style: TextStyle(
                        fontSize: 47.0,
                        color: Color.fromARGB(255,146,227,168),
                        fontWeight: FontWeight.w900),
                  ),
              const    Sizedbox(height: 20.0),
             const     Text(
                    "Welcome back you've",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500
                    ),
                  ),
              const    Text(
                    'been missed!',
                    style: TextStyle(
                      fontSize: 25,
                       fontWeight: FontWeight.w500
                    ),
                  ),
              const    SizedBox(
                    height: 40,
                  ),
                  textfield(
                    controller: emailcontroller,
                    name: 'email',
                    color: Color.fromARGB(255, 216, 224, 231),
                  
                  ),
                const   SizedBox(
                    height: 10,
                  ),
                  textfield(
                    controller: passwordcontroller,
                    name: 'Password',
                    color: Color.fromARGB(255, 216, 224, 231),
                  ),
                const  SizedBox(
                    height: 30,
                  ),
                  MyElevatedButton(
                      width: 160,
                      
                      colors: Colors.white,
                      color: Color.fromARGB(255,146,227,168),
                      buttonText: 'Login',
                      onPressed: () async {
                        try {
                          UserCredential userCredential =
                              await _auth.signInWithEmailAndPassword(
                            email: emailcontroller.text,
                            password: passwordcontroller.text,
                          );
                          LocalNotification.showSimpleNotification(
                                  title: "Simple Notification",
                                  body: "you are login is sucsessfull",
                                  payload: "This is a simple data");
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) {
                              
                                  
                              return const ListPage();
                            }),(routes)=>false
                          );
        
                          print(
                              'User signed in: ${userCredential.user!.email}');
                        } catch (e) {
                          print('Error signing in: $e');
                        }
                      }),
                       TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>signup_page()));
                        },
                        child: Text('Create new account',style: TextStyle(color: Colors.blue),)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
