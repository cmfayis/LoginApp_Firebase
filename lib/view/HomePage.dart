import 'package:firebase_app/view/SignUp.dart';
import 'package:firebase_app/view/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  // border: Border.all(color: Colors.grey, width: 5.0),
                ),
                child: Image.asset(
                  "assets/images/Exams-bro-removebg-preview (1).png",
                  fit: BoxFit.cover,
                  width: 250,
                  height: 350,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Taskify',
                style: GoogleFonts.raleway(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Streamline Your Day , Every Day',
                style: GoogleFonts.raleway(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Container(
                      width: 135,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black)),
                      child: const Center(child: Text('Login')),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  Signup()));
                    },
                    child: Container(
                      width: 135,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black)),
                      child: const Center(child: Text('Signup')),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 2,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Or Sign up With",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 50,
                    height: 2,
                    color: Colors.black,
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 215, 213, 213),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        "assets/images/ggg.png",
                        height: 40,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 50,
                        width: 1,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Continue with Google",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      )
                    ],
                  )),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
