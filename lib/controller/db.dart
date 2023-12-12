 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StudentData extends ChangeNotifier{

    void addData(String name,String age,String email, String phone,String course,String location ) async {
      User? currentUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection("notes").doc().set(
      {
        "Name": name,
        "Age": age,
        "Email": email,
        "Phone": phone,
        "course": course,
        "location":location,
        "userId":currentUser?.uid,
      },
    );

   
  }

}