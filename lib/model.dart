// import 'package:firebase_app/view/Listpage.dart';
// import 'package:firebase_app/view/widgets/elevatedbutton.dart';
// import 'package:firebase_app/view/widgets/notification.dart';
// import 'package:firebase_app/view/widgets/sizedbox.dart';
// import 'package:firebase_app/view/widgets/textfield.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class login_page extends StatelessWidget {
//   const login_page({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final FirebaseAuth _auth = FirebaseAuth.instance;
//     final emailcontroller = TextEditingController();
//     final passwordcontroller = TextEditingController();
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: BoxDecoration(
//             image: DecorationImage(image:AssetImage('assets/images/bk_ui.png'))
//           ),
//           child: SingleChildScrollView(
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Sizedbox(height: 140.0),
//                     Text(
//                       'Login Here',
//                       style: TextStyle(
//                           fontSize: 37.0,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w700),
//                     ),
//                     Sizedbox(height: 25.0),
//                     Text(
//                       "Welcome back you've",
//                       style: TextStyle(
//                         fontSize: 20.0,
//                       ),
//                     ),
//                     Text(
//                       'been missed!',
//                       style: TextStyle(
//                         fontSize: 20.0,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 60,
//                     ),
//                     textfield(
//                       controller: emailcontroller,
//                       name: 'email',
//                       color: Color.fromARGB(255, 216, 224, 231),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     textfield(
//                       controller: passwordcontroller,
//                       name: 'Password',
//                       color: Color.fromARGB(255, 216, 224, 231),
//                     ),
//                     SizedBox(
//                       height: 40,
//                     ),
//                     MyElevatedButton(
//                         width: double.infinity,
//                         colors: Colors.white,
//                         color: Colors.blue.shade100,
//                         buttonText: 'Login',
//                         onPressed: () async {
//                           try {
//                             UserCredential userCredential =
//                                 await _auth.signInWithEmailAndPassword(
//                               email: emailcontroller.text,
//                               password: passwordcontroller.text,
//                             );
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) {
//                                 LocalNotification.showSimpleNotification(
//                                     title: "Simple Notification",
//                                     body: "you are login is sucsessfull",
//                                     payload: "This is a simple data");
                                    
//                                 return List_page();
//                               }),
//                             );

//                             print(
//                                 'User signed in: ${userCredential.user!.email}');
//                           } catch (e) {
//                             print('Error signing in: $e');
//                           }
//                         }),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
