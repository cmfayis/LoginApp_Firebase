import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/view/add_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class List_page extends StatefulWidget {
  const List_page({super.key});

  @override
  State<List_page> createState() => _List_pageState();
}

class _List_pageState extends State<List_page> {
  @override
  Widget build(BuildContext context) {
    User? userId = FirebaseAuth.instance.currentUser;
    final students = FirebaseFirestore.instance.collection('notes');
     void delete(docid){
    students.doc(docid).delete();
  }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 146, 227, 168),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddUser()));
        },
        child:const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 146, 227, 168),
        title:const Text(
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
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: StreamBuilder(
                stream:FirebaseFirestore.instance
                    .collection("notes")
                    .where("userId", isEqualTo: userId?.uid)
                    .snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    print('error');
                  }
                    if (!snapshot.hasData || snapshot.data == null) {
                  return Text('No Data Found');
                }
                  if (snapshot.data!.docs.isEmpty) {
                    return Center(child: Text('No Data Found'));
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final studentData = snapshot.data!.docs[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                                right: 10.0, left: 10.0, top: 5.0),
                            child: Card(
                              color: Color.fromARGB(255, 146, 227, 168),
                              child: ListTile(
                                onTap: (){
                                    Navigator.pushNamed(
                                context,
                                '/update',
                                arguments: {
                                  'Name': studentData['Name'],
                                  'Age': studentData['Age'],
                                  'Email':studentData['Email'],
                                  'Phone':studentData['Phone'],
                                  'course':studentData['course'],
                                  'location':studentData['location'],
                                  'id': studentData.id,
                                },
                              );
                                },
                                trailing: IconButton(
                                  onPressed: () {
                                 delete(studentData.id);
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                                // leading: CircleAvatar(),
                                title: Text(
                                  studentData['Name'],
                                ),
                                subtitle: Text(studentData['Email']),
                                
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
