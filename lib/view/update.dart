// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/view/widgets/sizedbox.dart';
import 'widgets/custom_textfield.dart';

class update extends StatefulWidget {


  update({
    Key? key,
  
  }) : super(key: key);

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
   late String location;
  final _key = GlobalKey<FormState>();
   final CollectionReference userdata =
      FirebaseFirestore.instance.collection('notes');
  void upDatedata(studentId) {
    final DATA = {
      'Name': nameController.text,
      'Age': ageController.text,
      'Email':emailController.text,
      'Phone':phoneController.text,
      'course':courseController.text,
      'location':location,
    };
    userdata.doc(studentId).update(DATA).then((value) =>Navigator.pop(context) ,);
  }
  
  User? currentUser = FirebaseAuth.instance.currentUser;
@override

  @override
  Widget build(BuildContext context) {
   
     final args = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = args['Name'];
    ageController.text = args['Age'];
    emailController.text=args['Email'];
    phoneController.text=args['Phone'];
    courseController.text=args['course'];
    location=args['location'];


    final studentId = args['id'];
    
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
                  const  Text(
                      'Add Student',
                     style: TextStyle(fontSize: 35),
                    ),
                const    SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        gradient:const LinearGradient(
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
                       const     Sizedbox(height: 15.0),
                            CustomTextFormField(
                              controller: nameController,
                              labelText: 'First Name',
                              hintText: 'First Name',
                              validator: nameValidate,
                              icons:const Icon(Icons.person),
                            ),
                       const     Sizedbox(height: 15.0),
                            CustomTextFormField(
                              controller: ageController,
                              labelText: 'Age',
                              hintText: 'Age',
                              validator: ageValidate,
                              icons:const Icon(Icons.person),
                            ),
                    const        Sizedbox(height: 15.0),
                            CustomTextFormField(
                              controller: emailController,
                              labelText: 'Email',
                              hintText: 'Email',
                              validator: emailValidate,
                              icons:const Icon(Icons.email),
                            ),
                       const     Sizedbox(height: 15.0),
                            CustomTextFormField(
                              controller: phoneController,
                              labelText: 'Phone',
                              hintText: 'Phone',
                              validator: phoneValidate,
                              icons:const Icon(Icons.phone),
                            ),
                       const     Sizedbox(height: 15.0),
                            CustomTextFormField(
                              controller: courseController,
                              labelText: 'Course',
                              hintText: 'Course',
                              validator: nameValidate,
                              icons:const Icon(Icons.person),
                            ),
                       const     Sizedbox(height: 15.0),
                       Text(location),
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
                                child:const Text("Add Image"),
                              ),
                            ),
                         const   Sizedbox(height: 15.0),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                ),
                                onPressed: () {
                                  if (_key.currentState!.validate()) {
                                    // final name = nameController.text;
                                    // final age = ageController.text;
                                    // final email = emailController.text;
                                    // final phone = phoneController.text;
                                    // final course = courseController.text;
                                    upDatedata(studentId);
                                    nameController.clear();
                                    ageController.clear();
                                    emailController.clear();
                                    phoneController.clear();
                                    courseController.clear();
                                  }
                                   Navigator.pop(context);
                                },
                                child:const Text('Submit'),
                              ),
                            ),
                       const     Sizedbox(height: 45.0),
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
