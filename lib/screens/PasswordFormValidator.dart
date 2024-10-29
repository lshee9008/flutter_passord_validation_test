import 'package:flutter/material.dart';

class Passwordformvalidator extends StatefulWidget {
  const Passwordformvalidator({super.key});

  @override
  State<Passwordformvalidator> createState() => _PasswordformvalidatorState();
}

class _PasswordformvalidatorState extends State<Passwordformvalidator> {
  bool isSuccess = false; // initially

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // for android
        backgroundColor: Colors.black,
        title: Text(
          'Password Form Validation',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          15,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
