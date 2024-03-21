import 'package:firebase_app/controller/db.dart';
import 'package:firebase_app/view/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'add_user.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 47, 245, 235),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddUser()),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 47, 245, 235),
        title: Text(
          "Student Data",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<StudentData>(
            builder: (context, studentData, child) {
              final data = studentData.getData();
              return StreamBuilder(
                stream: data,
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.data!.docs.isEmpty) {
                    return Center(child: Text('No Data Found'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final studentData = snapshot.data!.docs[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Card(
                            elevation: 4,
                            shadowColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(color: Colors.grey[200]!),
                            ),
                            color: Colors.blueGrey[
                                50], // Use a subtle color like blueGrey[50]
                            child: Container(
                              height: 100,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Center(
                                child: ListTile(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/update',
                                      arguments: {
                                        'Name': studentData['Name'],
                                        'Age': studentData['Age'],
                                        'Email': studentData['Email'],
                                        'Phone': studentData['Phone'],
                                        'course': studentData['course'],
                                        'location': studentData['location'],
                                        'id': studentData.id,
                                      },
                                    );
                                  },
                                  trailing: IconButton(
                                    onPressed: () {
                                      Provider.of<StudentData>(context,
                                              listen: false)
                                          .delete(studentData.id);
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                  title: Text(
                                    studentData['Name'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    studentData['Email'],
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey[600]),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
