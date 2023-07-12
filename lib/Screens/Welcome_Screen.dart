// import 'package:doctor_panel/Config/Colors.dart';
import 'package:doctor_panel/Screens/Login_Screen.dart';
import 'package:doctor_panel/Screens/Signup_Screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/wave_design_image.png",
            height: 300,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 250),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            "assets/WelcomeScreen.png",
                            height: 300,
                          ),
                        ),
                        const Text(
                          "Welcome Doctor",
                          style: TextStyle(
                            color: Color.fromARGB(255, 24, 188, 230),
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0,
                            wordSpacing: 2,
                          ),
                        ),
                        SizedBox(height: 10),
                        const Text(
                          "Thank you for choosing us as your trusted healthcare partner.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 125, 125, 134),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0,
                            wordSpacing: 1,
                          ),
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Login(),
                                  ),
                                );
                              },
                              color: Color.fromARGB(255, 15, 170, 241),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 5,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 28),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUp(),
                                  ),
                                );
                              },
                              color: Color.fromARGB(255, 15, 170, 241),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 5,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 28),
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
