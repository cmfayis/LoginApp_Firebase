import 'package:firebase_app/controller/db.dart';
import 'package:firebase_app/controller/location.dart';
import 'package:firebase_app/view/widgets/mainpage.dart';
import 'package:firebase_app/view/widgets/sizedbox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/custom_textfield.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

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
      appBar: AppBar(),
      // backgroundColor: const Color.fromARGB(255, 215, 213, 213),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Color.fromARGB(255, 146, 227, 168)],
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Add Student',
                    style: TextStyle(fontSize: 35),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        const Sizedbox(height: 15.0),
                        CustomTextFormField(
                          controller: nameController,
                          labelText: 'First Name',
                          hintText: 'First Name',
                          validator: nameValidate,
                          icons: const Icon(Icons.person),
                        ),
                        const Sizedbox(height: 15.0),
                        CustomTextFormField(
                          controller: ageController,
                          labelText: 'Age',
                          hintText: 'Age',
                          validator: ageValidate,
                          icons: const Icon(Icons.person),
                        ),
                        const Sizedbox(height: 15.0),
                        CustomTextFormField(
                          controller: emailController,
                          labelText: 'Email',
                          hintText: 'Email',
                          validator: emailValidate,
                          icons: const Icon(Icons.email),
                        ),
                        const Sizedbox(height: 15.0),
                        CustomTextFormField(
                          controller: phoneController,
                          labelText: 'Phone',
                          hintText: 'Phone',
                          validator: phoneValidate,
                          icons: const Icon(Icons.phone),
                        ),
                        const Sizedbox(height: 15.0),
                        CustomTextFormField(
                          controller: courseController,
                          labelText: 'Course',
                          hintText: 'Course',
                          validator: nameValidate,
                          icons: const Icon(Icons.person),
                        ),
                        const Sizedbox(height: 15.0),
                        Text(location.currentAddress),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 134, 230, 163),
                            ),
                            onPressed: () {
                              Provider.of<LocationProvider>(context,
                                      listen: false)
                                  .getLocation();
                            },
                            child: const Text("Add Location"),
                          ),
                        ),
                        const Sizedbox(height: 15.0),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 134, 230, 163),
                            ),
                            onPressed: () {
                              if (_key.currentState!.validate()) {
                                final name = nameController.text;
                                final age = ageController.text;
                                final email = emailController.text;
                                final phone = phoneController.text;
                                final course = courseController.text;
                                Provider.of<StudentData>(context, listen: false)
                                    .addData(name, age, email, phone, course,
                                        location.currentAddress);
                                nameController.clear();
                                ageController.clear();
                                emailController.clear();
                                phoneController.clear();
                                courseController.clear();
                              }
                              Navigator.pop(context);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => const MainPage()));
                              location.clearCurrentAddress();
                              Provider.of<StudentData>(context, listen: false)
                                  .getData();
                            },
                            child: const Text('Submit'),
                          ),
                        ),
                        const Sizedbox(height: 45.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
