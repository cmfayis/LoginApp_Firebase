import 'package:firebase_app/controller/db.dart';
import 'package:firebase_app/controller/location.dart';
import 'package:firebase_app/controller/profileprovider.dart';
import 'package:firebase_app/firebase_options.dart';
import 'package:firebase_app/view/HomePage.dart';
import 'package:firebase_app/view/Listpage.dart';
import 'package:firebase_app/view/update.dart';
import 'package:firebase_app/view/widgets/mainpage.dart';
import 'package:firebase_app/view/widgets/notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProfileProvider>(
          create: (_) => ProfileProvider(),
        ),
        ChangeNotifierProvider(create: (context) => StudentData()),
        ChangeNotifierProvider(create: (context) => LocationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const MainPage();
              } else {
                return const HomePage();
              }
            }),
        routes: {
          '/update': (context) => update(),
        },
      ),
    );
  }
}
