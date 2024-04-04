import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/controller/profileprovider.dart';
import 'package:firebase_app/view/loginpage.dart';
import 'package:firebase_app/view/widgets/mainpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  const Signup({super.key,});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 30),
              Image.asset(
                'assets/images/signin.png',
                height: 250,
                width: 300,
              ),
              const Text(
                'Create An Account',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 22.0),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Enter Your Name',
                  labelText: 'Username',
                  prefixIcon: const Icon(
                    Icons.person_rounded,
                    color: Colors.black,
                  ),
                  contentPadding: const EdgeInsets.all(7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 7),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Enter Your Email',
                  labelText: 'Email',
                  prefixIcon: const Icon(
                    Icons.email_rounded,
                    color: Colors.black,
                  ),
                  contentPadding: const EdgeInsets.all(7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 7),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter Your Password',
                  labelText: 'Password',
                  prefixIcon: const Icon(
                    Icons.lock_rounded,
                    color: Colors.black,
                  ),
                  contentPadding: const EdgeInsets.all(7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 7),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  hintText: 'Enter Your Phone',
                  labelText: 'Phone',
                  prefixIcon: const Icon(
                    Icons.phone_rounded,
                    color: Colors.black,
                  ),
                  contentPadding: const EdgeInsets.all(7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Already have an account',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Signin',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              MaterialButton(
                onPressed: () async {
                  try {
                    UserCredential userCredential =
                        await _auth.createUserWithEmailAndPassword(
                      email: _emailController.text.trim(),
                      password: _passwordController.text,
                    );
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(userCredential.user!.uid)
                        .set({
                      'name': _nameController.text.trim(),
                      'email': _emailController.text.trim(),
                    });
                    Provider.of<ProfileProvider>(context, listen: false)
                        .getUserData();

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const MainPage()),
                      (route) => false,
                    );

                    print('User created: ${userCredential.user!.email}');
                  } catch (e) {
                    print('Error creating user: $e');
                  }
                },
                height: 50,
                color: const Color.fromARGB(255, 215, 213, 213),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
