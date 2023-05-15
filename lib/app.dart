import 'package:flutter/material.dart';
import 'package:flutter_class_test/dashboard.dart';
import 'package:flutter_class_test/login.dart';
import 'package:flutter_class_test/register.dart';
import 'package:flutter_class_test/view_book.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const RegisterPages(),
        '/login': (context) => const LoginPages(),
        '/dashboard': (context) => const DashboardPage(),
        '/books': (context) => const MyBooks(),
      },
    );
  }
}
