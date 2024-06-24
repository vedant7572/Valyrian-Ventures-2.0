import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:valyrian_ventures/admin/add_item.dart';
import 'package:valyrian_ventures/admin/admin_login.dart';
import 'package:valyrian_ventures/admin/home_admin.dart';
import 'package:valyrian_ventures/pages/bottom_navbar.dart';
import 'package:valyrian_ventures/pages/home.dart';
import 'package:valyrian_ventures/pages/login.dart';
import 'package:valyrian_ventures/pages/profile.dart';
import 'package:valyrian_ventures/pages/signup.dart';
import 'package:valyrian_ventures/pages/wallet.dart';
// import 'package:valyrian_ventures/pages/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogIn(), //check
    );
  }
}