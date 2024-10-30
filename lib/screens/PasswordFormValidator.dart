import 'dart:async';
import 'dart:math';
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

  Timer? _timer;
  Color _randomColor = Color.fromARGB(255, 44, 18, 36); // initial color
  Color _randomColor2 = Color.fromARGB(255, 44, 18, 36); // initial color
  Random _random = Random();

  @override
  void initState() {
    super.initState();
    _startColorChangeTimer();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer to prevent memory leaks
    super.dispose();
  }

  void _startColorChangeTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      // Change duration to 0.5 seconds
      setState(() {
        _randomColor = _generateRandomColor();
        _randomColor2 = _generateRandomColor();
      });
    });
  }

  Color _generateRandomColor() {
    return Color.fromARGB(
      255,
      _random.nextInt(50), // Red component
      _random.nextInt(50), // Green component
      _random.nextInt(50), // Blue component
    );
  }

  Alignment _AlignmentRandom() {
    return AlignmentArray[_random.nextInt(8)];
  }

  List<Alignment> AlignmentArray = [
    Alignment.bottomCenter,
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.center,
    Alignment.centerLeft,
    Alignment.centerRight,
    Alignment.topCenter,
    Alignment.topLeft,
    Alignment.topRight
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _randomColor,
                  _randomColor2, // Random color
                ],
                begin: _AlignmentRandom(),
                end: _AlignmentRandom(),
              ),
            ),
          ),
          Container(
            color: const Color.fromARGB(93, 0, 0, 0),
            height: double.infinity,
            width: double.infinity,
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  SizedBox(
                    height: 73,
                  ),
                  Text(
                    "로그인을 해주세요",
                    style: TextStyle(
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 37,
                  ),
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
                                color: Colors.white,
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
                            hoverColor: Colors.white,
                            prefixIconColor: Colors.white,
                            suffixIconColor: Colors.white,
                            fillColor: Colors.white,
                            iconColor: Colors.white,
                            focusColor: Colors.white,
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Colors.white,
                            ),
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
                          defaultColor: Colors.white,

                          uppercaseCharCount: 1,
                          lowercaseCharCount: 2,
                          numericCharCount: 1,
                          normalCharCount: 3,
                          specialCharCount: 1,

                          width: 350,
                          height: 200,
                          minLength:
                              8, // password should be at list 8 character length
                          onSuccess: () {
                            setState(() {
                              isSuccess = true;
                            });
                          },
                          onFail: () {
                            isSuccess = false;
                          },
                          controller: controller,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
