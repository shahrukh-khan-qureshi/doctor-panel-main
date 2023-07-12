import 'package:doctor_panel/Config/Colors.dart';
import 'package:doctor_panel/Screens/Login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   bool passToggle = true;
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.white,
//       child: SingleChildScrollView(
//         child: SafeArea(
//             child: Column(
//           children: [
//             SizedBox(height: 20),
//             Padding(
//               padding: EdgeInsets.all(20),
//               child: Image.asset("assets/wave_design_image.png"),
//             ),
//             const SizedBox(height: 10),
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
//               child: TextField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     label: Text("Full name"),
//                     prefixIcon: Icon(Icons.person)),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
//               child: TextField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     label: Text("Email"),
//                     prefixIcon: Icon(Icons.email)),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
//               child: TextField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     label: Text("Address"),
//                     prefixIcon: Icon(Icons.home)),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
//               child: TextField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     label: Text("Cnic"),
//                     prefixIcon: Icon(Icons.card_membership)),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
//               child: TextField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     label: Text("University"),
//                     prefixIcon: Icon(Icons.book)),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
//               child: TextField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     label: Text("Phone"),
//                     prefixIcon: Icon(Icons.phone)),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
//               child: TextField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     label: Text("Specialization"),
//                     prefixIcon: Icon(Icons.type_specimen)),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: TextField(
//                 obscureText: passToggle ? true : false,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   label: Text("Enter Password"),
//                   prefixIcon: Icon(Icons.lock),
//                   suffixIcon: InkWell(
//                     onTap: () {
//                       if (passToggle == true) {
//                         passToggle = false;
//                       } else {
//                         passToggle = true;
//                       }
//                       setState(() {});
//                     },
//                     child: passToggle
//                         ? Icon(CupertinoIcons.eye_slash_fill)
//                         : Icon(CupertinoIcons.eye_fill),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: TextField(
//                 obscureText: passToggle ? true : false,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   label: Text("Confirm Password"),
//                   prefixIcon: Icon(Icons.lock),
//                   suffixIcon: InkWell(
//                     onTap: () {
//                       if (passToggle == true) {
//                         passToggle = false;
//                       } else {
//                         passToggle = true;
//                       }
//                       setState(() {});
//                     },
//                     child: passToggle
//                         ? Icon(CupertinoIcons.eye_slash_fill)
//                         : Icon(CupertinoIcons.eye_fill),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SizedBox(
//                 width: 300,
//                 child: Material(
//                   color: blue,
//                   borderRadius: BorderRadius.circular(10),
//                   child: InkWell(
//                     onTap: () {},
//                     child: const Padding(
//                       padding:
//                           EdgeInsets.symmetric(vertical: 15, horizontal: 40),
//                       child: Center(
//                         child: Text(
//                           "Upload your degree",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SizedBox(
//                 width: double.infinity,
//                 child: Material(
//                   color: blue,
//                   borderRadius: BorderRadius.circular(10),
//                   child: InkWell(
//                     onTap: () {},
//                     child: const Padding(
//                       padding:
//                           EdgeInsets.symmetric(vertical: 15, horizontal: 40),
//                       child: Center(
//                         child: Text(
//                           "Create a account",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Already have a acount?",
//                   style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.grey),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => Login()));
//                   },
//                   child: Text(
//                     "Login",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                       color: Color(0xFF0000FF),
//                     ),
//                   ),
//                 )
//               ],
//             )
//           ],
//         )),
//       ),
//     );
//   }
// }

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/wave_design_image.png",
                height: 200,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Full name"),
                    prefixIcon: Icon(Icons.person)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Email"),
                    prefixIcon: Icon(Icons.email)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Address"),
                    prefixIcon: Icon(Icons.home)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Cnic"),
                    prefixIcon: Icon(Icons.card_membership)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("University"),
                    prefixIcon: Icon(Icons.book)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Phone"),
                    prefixIcon: Icon(Icons.phone)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Specialization"),
                    prefixIcon: Icon(Icons.type_specimen)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                obscureText: passToggle ? true : false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter Password"),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: InkWell(
                    onTap: () {
                      if (passToggle == true) {
                        passToggle = false;
                      } else {
                        passToggle = true;
                      }
                      setState(() {});
                    },
                    child: passToggle
                        ? Icon(CupertinoIcons.eye_slash_fill)
                        : Icon(CupertinoIcons.eye_fill),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                obscureText: passToggle ? true : false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Confirm Password"),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: InkWell(
                    onTap: () {
                      if (passToggle == true) {
                        passToggle = false;
                      } else {
                        passToggle = true;
                      }
                      setState(() {});
                    },
                    child: passToggle
                        ? Icon(CupertinoIcons.eye_slash_fill)
                        : Icon(CupertinoIcons.eye_fill),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Colors.blue),
              child: MaterialButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => SignUp(),
                  //   ),
                  // );
                },
                elevation: 15,
                child: Text(
                  "Upload your Degree",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Colors.blue),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                },
                elevation: 15,
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 20, 113, 235),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
