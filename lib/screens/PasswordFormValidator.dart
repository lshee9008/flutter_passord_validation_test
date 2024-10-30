import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:lottie/lottie.dart';

class Passwordformvalidator extends StatefulWidget {
  const Passwordformvalidator({super.key});

  @override
  State<Passwordformvalidator> createState() => _PasswordformvalidatorState();
}

class _PasswordformvalidatorState extends State<Passwordformvalidator> {
  final TextEditingController controller = TextEditingController();
  bool isSuccess = false; // initially
  bool _obscureText = true;

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
        child: SingleChildScrollView(
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
                      obscureText: _obscureText,
                      controller: controller,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: isSuccess ? Colors.green : Colors.red,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // the main parts
                    // validation parts
                    FlutterPwValidator(
                      width: 350,
                      height: 200,
                      minLength:
                          8, // password should be at list 8 character length
                      onSuccess: () {},
                      controller: controller,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
