import 'package:firebase_app/controller/db.dart';
import 'package:firebase_app/controller/location.dart';
import 'package:firebase_app/view/widgets/sizedbox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom_textfield.dart';

class AddUser extends StatefulWidget {
  AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final rollnumberController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final courseController = TextEditingController();
  final _key = GlobalKey<FormState>();

  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final location = Provider.of<LocationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor:const Color.fromARGB(255, 146, 227, 168),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 146, 227, 168), Colors.white],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Padding(
                padding: const EdgeInsets.all(17.0),
                child: Column(
                  children: [
                    const Text(
                      'Add Student',
                      style: TextStyle(fontSize: 35),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Color.fromARGB(255, 146, 227, 168)
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: Column(
                          children: [
                            Sizedbox(height: 15.0),
                            CustomTextFormField(
                              controller: nameController,
                              labelText: 'First Name',
                              hintText: 'First Name',
                              validator: nameValidate,
                              icons: Icon(Icons.person),
                            ),
                            Sizedbox(height: 15.0),
                            CustomTextFormField(
                              controller: ageController,
                              labelText: 'Age',
                              hintText: 'Age',
                              validator: ageValidate,
                              icons: Icon(Icons.person),
                            ),
                            Sizedbox(height: 15.0),
                            CustomTextFormField(
                              controller: emailController,
                              labelText: 'Email',
                              hintText: 'Email',
                              validator: emailValidate,
                              icons: Icon(Icons.email),
                            ),
                            Sizedbox(height: 15.0),
                            CustomTextFormField(
                              controller: phoneController,
                              labelText: 'Phone',
                              hintText: 'Phone',
                              validator: phoneValidate,
                              icons: Icon(Icons.phone),
                            ),
                            Sizedbox(height: 15.0),
                            CustomTextFormField(
                              controller: courseController,
                              labelText: 'Course',
                              hintText: 'Course',
                              validator: nameValidate,
                              icons: Icon(Icons.person),
                            ),
                            Sizedbox(height: 15.0),
                            Text(location.currentAddress),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                ),
                                onPressed: () {
                                  Provider.of<LocationProvider>(context,
                                          listen: false)
                                      .getLocation();
                                },
                                child: Text("Add Image"),
                              ),
                            ),
                            Sizedbox(height: 15.0),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                ),
                                onPressed: () {
                                  if (_key.currentState!.validate()) {
                                    final name = nameController.text;
                                    final age = ageController.text;
                                    final email = emailController.text;
                                    final phone = phoneController.text;
                                    final course = courseController.text;
                                    Provider.of<StudentData>(context,
                                            listen: false)
                                        .addData(name, age, email, phone,
                                            course, location.currentAddress);
                                    nameController.clear();
                                    ageController.clear();
                                    emailController.clear();
                                    phoneController.clear();
                                    courseController.clear();
                                  }
                                  Navigator.pop(context);
                                  location.clearCurrentAddress();
                                },
                                child: Text('Submit'),
                              ),
                            ),
                            Sizedbox(height: 45.0),
                          ],
                        ),
                      ),
                    ),
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
