import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loja01/firebase_options.dart';
import 'package:loja01/screens/home_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter's Roupas",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: const Color.fromARGB(255, 4, 100, 100)),
      home: HomeScreen(),
    );
  }
}
