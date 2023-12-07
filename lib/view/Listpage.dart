import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/view/add_user.dart';
import 'package:firebase_app/view/update.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class List_page extends StatelessWidget {
  const List_page({super.key});

  @override
  Widget build(BuildContext context) {
    User? userId = FirebaseAuth.instance.currentUser;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 146, 227, 168),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddUser()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 146, 227, 168),
        title: Text(
          "Student Datas",
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Color.fromARGB(255, 146, 227, 168),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            color: Colors.white,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("notes")
                    .where("userId", isEqualTo: userId?.uid)
                    .snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    print('error');
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return Text('No Data Found');
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final studentData = snapshot.data.docs[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                                right: 10.0, left: 10.0, top: 5.0),
                            child: Card(
                              color: Color.fromARGB(255, 146, 227, 168),
                              child: ListTile(
                                trailing: IconButton(
                                  onPressed: () {
                                    Get.toNamed('/update', arguments: {
                                      'Name': studentData['Name'],
                                      'Age': studentData[
                                          'Age'],
                                    });
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                                leading: CircleAvatar(),
                                title: Text(
                                  studentData['Name'],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                  return Container();
                }),
          ),
        ),
      ),
    );
  }
}
