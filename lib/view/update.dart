
import 'package:firebase_app/controller/db.dart';
import 'package:firebase_app/view/widgets/sizedbox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/custom_textfield.dart';

class update extends StatefulWidget {
  update({Key? key}) : super(key: key);

  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255,146,227,168),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255,146,227,168), Colors.white],
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
                    Text(
                      'Add Student',
                     style: TextStyle(fontSize: 35),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Color.fromARGB(255,146,227,168)
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: Column(
                          children: [
                            // Provider.of<picimage>(context).selectedimagepath.isEmpty
                            //     ? Text('Select Image')
                            //     : CircleAvatar(
                            //         radius: 50.0,
                            //         backgroundImage: FileImage(
                            //           File(Provider.of<picimage>(context).selectedimagepath),
                            //         ),
                            //       ),
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
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                ),
                                onPressed: () {
                                  // Provider.of<picimage>(context, listen: false)
                                  //     .getimage(ImageSource.camera);
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
                                    Provider.of<StudentData>(context,listen: false).addData(name, age, email, phone, course);
                                    nameController.clear();
                                    ageController.clear();
                                    emailController.clear();
                                    phoneController.clear();
                                    courseController.clear();
                                  }
                                   Navigator.pop(context);
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
