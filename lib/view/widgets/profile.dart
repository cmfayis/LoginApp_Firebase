import 'package:firebase_app/controller/profileprovider.dart';
import 'package:firebase_app/view/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileProvider>(context, listen: false).getUserData();
    return Consumer<ProfileProvider>(
      builder: (context, profileProvider, child) {
        return Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                  ),
                ),
                const SizedBox(height: 16.0),
                Center(
                  child: Column(
                    children: [
                      Text(
                        profileProvider.name,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        profileProvider.email,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                const Divider(
                  color: Colors.black,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.policy),
                  title: const Text('Terms and Conditions'),
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Terms()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.help_outline),
                  title: const Text('FAQ'),
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Faq()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.support),
                  title: const Text('Support Us'),
                  onTap: () {
                    Provider.of<ProfileProvider>(context, listen: false)
                        .getUserData();
                    // Navigator.p
                    // ush(context,
                    //     MaterialPageRoute(builder: (context) => SupportPage()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.help),
                  title: const Text('Help'),
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => HelpPage()));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.black, // Change the color of the text
                    ),
                  ),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                        (route) => false);
                  },
                  // onTap: () => profileProvider.logout(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
