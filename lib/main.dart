import 'package:flutter/material.dart';
import 'package:flutter_password_validation_test/screens/PasswordFormValidator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Passwordformvalidator(),
    );
  }
}
