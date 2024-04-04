import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileProvider extends ChangeNotifier {
  String name = '';
  String email = '';

  Future<void> getUserData() async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      print(currentUser!.uid);
      DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore
          .instance
          .collection("users")
          .doc(currentUser.uid)
          .get();

      // Check if the 'name' field exists before accessing it
      if (userData.exists && userData.data()!.containsKey('name')) {
        name = userData.get('name');
      } else {
        name = 'Name not available';
      }

      // Check if the 'email' field exists before accessing it
      if (userData.exists && userData.data()!.containsKey('email')) {
        email = userData.get('email');
      } else {
        email = 'Email not available';
      }

      print('$name dddddddddddddddd');

      notifyListeners();
    } catch (error) {
      print('Error retrieving user data: $error');
    }
  }
}
