import 'package:firebase_app/controller/db.dart';
import 'package:firebase_app/firebase_options.dart';
import 'package:firebase_app/view/HomePage.dart';
import 'package:firebase_app/view/update.dart';
import 'package:firebase_app/view/widgets/notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
await LocalNotification.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) => StudentData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.fallback(),
        home: HomePage(
          
        ),
        routes: {
    '/update': (context) => update(),
  },
      ),
    );
  }
}