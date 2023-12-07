import 'package:firebase_app/view/SignUp.dart';
import 'package:firebase_app/view/Login.dart';
import 'package:firebase_app/view/widgets/elevatedbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 110,
            ),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/Exams-bro-removebg-preview (1).png"))),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Welcome ToDo',
              style: GoogleFonts.raleway(
                  fontSize: 50, fontWeight: FontWeight.w700),
            ),
            Text(
              '...',
              style: TextStyle(
                  fontSize: 105, color: Color.fromARGB(255,146,227,168)),
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyElevatedButton(
                    width: 135,
                    colors: Colors.white,
                    color: Color.fromARGB(255,146,227,168),
                    buttonText: 'Login',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => login_page()));
                    }),
                SizedBox(
                  width: 30,
                ),
                MyElevatedButton(
                    width: 135,
                    colors: Colors.black,
                    color: Colors.white,
                    buttonText: 'Sign Up',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => signup_page()));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
