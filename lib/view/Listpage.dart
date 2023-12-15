import 'package:firebase_app/controller/db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'add_user.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 146, 227, 168),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddUser()),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 146, 227, 168),
        title: const Text(
          "Student Data",
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
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Consumer<StudentData>(
              builder: (BuildContext context, studentData, child) {
                final data = studentData.getData();
                return StreamBuilder(
                  stream: data,
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print('Error: ${snapshot.error}');
                      return Text('Error occurred');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('No Data Found'));
                    }

                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final studentData = snapshot.data!.docs[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                            right: 10.0,
                            left: 10.0,
                            top: 5.0,
                          ),
                          child: Card(
                            color: Color.fromARGB(255, 146, 227, 168),
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
                                  Provider.of<StudentData>(context)
                                      .delete(studentData.id);
                                },
                                icon: Icon(Icons.delete),
                              ),
                              title: Text(
                                studentData['Name'],
                              ),
                              subtitle: Text(studentData['Email']),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
