import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
              child: isSuccess
                  ? Lottie.network(
                      "https://lottie.host/c288e345-7b57-45c8-b224-cc6af457bfe0/7wi1v8ZrWM.json")
                  : Lottie.network(
                      "https://lottie.host/de8895c3-39b1-488d-8089-d42c697bd7f2/8q4PKhMEyb.json"),
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
