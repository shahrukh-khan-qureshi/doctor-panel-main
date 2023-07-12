import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'AnswerQuestionsPage.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'HospitalListScreen.dart';
import 'Patient_Screen.dart';
import 'Payment_Screen.dart';
import 'Profile_Screen.dart';
import 'Schedule_Screen.dart';
import 'findDoctor_screen.dart';
import 'privacy_policy.dart';

class DoctorProfileScreen extends StatefulWidget {
  const DoctorProfileScreen({Key? key}) : super(key: key);

  @override
  _DoctorProfileScreenState createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  String firstName = '';
  String lastName = '';
  String prefix = 'Dr.';
  String specialty = '';
  int rank = 1;
  String medicalEducation = '';
  String residency = '';
  String internship = '';
  String fellowship = '';
  String biography = '';

  String PopbuttonValue = "";
  // ignore: non_constant_identifier_names
  late String DrawerSelector = "Home";
  void _updateSelectedUser(String user) {
    setState(() {
      DrawerSelector = user;
    });
  }

  void _updateAccount() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Account'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildTextField(
                  'First Name',
                  firstName,
                  (value) {
                    setState(() {
                      firstName = value;
                    });
                  },
                  TextInputType.text,
                  maxLines: 1,
                ),
                buildTextField(
                  'Last Name',
                  lastName,
                  (value) {
                    setState(() {
                      lastName = value;
                    });
                  },
                  TextInputType.text,
                  maxLines: 1,
                ),
                buildTextField(
                  'Prefix',
                  prefix,
                  (value) {
                    setState(() {
                      prefix = value;
                    });
                  },
                  TextInputType.text,
                  maxLines: 1,
                ),
                buildTextField(
                  'Specialty',
                  specialty,
                  (value) {
                    setState(() {
                      specialty = value;
                    });
                  },
                  TextInputType.text,
                  maxLines: 1,
                ),
                buildTextField(
                  'Medical Education',
                  medicalEducation,
                  (value) {
                    setState(() {
                      medicalEducation = value;
                    });
                  },
                  TextInputType.text,
                  maxLines: 1,
                ),
                buildTextField(
                  'Residency',
                  residency,
                  (value) {
                    setState(() {
                      residency = value;
                    });
                  },
                  TextInputType.text,
                  maxLines: 3,
                ),
                buildTextField(
                  'Internship',
                  internship,
                  (value) {
                    setState(() {
                      internship = value;
                    });
                  },
                  TextInputType.text,
                  maxLines: 15,
                ),
                buildTextField(
                  'Fellowship',
                  fellowship,
                  (value) {
                    setState(() {
                      fellowship = value;
                    });
                  },
                  TextInputType.text,
                  maxLines: 15,
                ),
                buildTextField(
                  'Biography',
                  biography,
                  (value) {
                    setState(() {
                      biography = value;
                    });
                  },
                  TextInputType.text,
                  maxLines: 10,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Perform any necessary actions with the updated values
                // ...

                Navigator.of(context).pop();
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }

  List<String> timeSlots = []; // List to store time slots
  TextEditingController descriptionController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String? profileImagePath; // Variable to store the profile image path

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 33, 124, 243),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Hospital Service',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // on tap will lead to notification page
            },
          ),
        ],
      ),
      drawer: drawerWidget(
        updateSelectedUser: (String) {},
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hello Shahrukh",
                      style: GoogleFonts.aBeeZee(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _editProfilePicture();
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: profileImagePath != null
                            ? AssetImage(profileImagePath!)
                            : null,
                        child: profileImagePath == null
                            ? Icon(Icons.person, size: 30)
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              buildTextField(
                'First Name',
                firstName,
                (value) {
                  setState(() {
                    firstName = value;
                  });
                },
                TextInputType
                    .text, // Update the data type to TextInputType.text
                maxLines:
                    1, // Set maxLines to 1 since it's a single-line text field
              ),
              buildTextField(
                'Last Name',
                lastName,
                (value) {
                  setState(() {
                    lastName = value;
                  });
                },
                TextInputType.text,
                maxLines: 1,
              ),
              buildTextField(
                'Prefix',
                prefix,
                (value) {
                  setState(() {
                    prefix = value;
                  });
                },
                TextInputType.text,
                maxLines: 1,
              ),
              buildTextField(
                'Specialty',
                specialty,
                (value) {
                  setState(() {
                    specialty = value;
                  });
                },
                TextInputType.text,
                maxLines: 1,
              ),
              buildTextField(
                'Rank',
                rank.toString(),
                (value) {
                  setState(() {
                    rank = int.tryParse(value) ?? 1;
                  });
                },
                TextInputType.number,
                maxLines: 1,
              ),
              buildTextField(
                'Medical Education',
                medicalEducation,
                (value) {
                  setState(() {
                    medicalEducation = value;
                  });
                },
                TextInputType.text,
                maxLines: 3,
              ),
              buildTextField(
                'Residency',
                residency,
                (value) {
                  setState(() {
                    residency = value;
                  });
                },
                TextInputType.text,
                maxLines: 3,
              ),
              buildTextField(
                'Internship',
                internship,
                (value) {
                  setState(() {
                    internship = value;
                  });
                },
                TextInputType.text,
                maxLines: 3,
              ),
              buildTextField(
                'Fellowship',
                fellowship,
                (value) {
                  setState(() {
                    fellowship = value;
                  });
                },
                TextInputType.text,
                maxLines: 3,
              ),
              buildTextField(
                'Biography',
                biography,
                (value) {
                  setState(() {
                    biography = value;
                  });
                },
                TextInputType.text,
                maxLines: 3,
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      side: BorderSide(
                        color: Colors.black,
                        width: 0,
                      ),
                    ),
                    child: Text(
                      'CANCEL',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _updateAccount,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'UPDATE',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Upcoming Appointments',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Material(
                              child: ScheduleScreen(),
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'View all',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(4, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      width: 265,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text(
                              'patient',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('Problem'),
                            trailing: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PatientScreen(),
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage('assets/doctor1.jpg'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Divider(
                              thickness: 1,
                              height: 20,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    color: Colors.black54,
                                  ),
                                  SizedBox(width: 5),
                                  Text('12/01/20'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time_filled,
                                    color: Colors.black54,
                                  ),
                                  SizedBox(width: 5),
                                  Text('10:30 AM'),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Confirmed',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _editProfilePicture() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        profileImagePath = image.path;
      });
    }
  }
}

class TimeSlotDialog extends StatefulWidget {
  final Function(String) onTimeSlotAdded;

  const TimeSlotDialog({Key? key, required this.onTimeSlotAdded})
      : super(key: key);

  @override
  _TimeSlotDialogState createState() => _TimeSlotDialogState();
}

class _TimeSlotDialogState extends State<TimeSlotDialog> {
  TextEditingController timeSlotController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Time Slot'),
      content: TextField(
        controller: timeSlotController,
        decoration: InputDecoration(
          labelText: 'Time Slot',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            String timeSlot = timeSlotController.text;
            widget.onTimeSlotAdded(timeSlot);
            Navigator.pop(context);
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}

class drawerWidget extends StatefulWidget {
  final Function(String) updateSelectedUser;
  const drawerWidget({required this.updateSelectedUser});

  @override
  State<drawerWidget> createState() => _drawerWidgetState();
}

class _drawerWidgetState extends State<drawerWidget> {
  String DrawerSelector = "Home";
  File? _profilePic;

  Future<void> _editProfilePic() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profilePic = File(pickedFile.path);
      });
    }
  }

  void logout() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Logging out..."),
        duration: Duration(seconds: 2),
      ),
    );

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        DrawerSelector = "Home";
      });
      widget.updateSelectedUser(DrawerSelector);
    });
  }

  void shareToFriend() {
    final String message = "Check out this awesome app!";
    Share.share(message);
  }

  void contactUs() async {
    final String email = "70078100@student.uol.edu.pk";
    final String subject = "Regarding Your App";
    final String body =
        "Hi,\n\nI have a question about your app. Can you please help me with that?\n\nThanks.";

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query:
          'subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}',
    );

    final String url = emailUri.toString();

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('No email clients found!');
    }
  }

  void _showFeedbackDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String feedbackText = '';

        return AlertDialog(
          title: Text("Feedback"),
          content: TextField(
            onChanged: (value) {
              feedbackText = value;
            },
            decoration: InputDecoration(
              hintText: "Enter your feedback here...",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                print("Feedback: $feedbackText");
                Navigator.pop(context);
              },
              child: Text("Submit"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var profileImagePath;
    return Drawer(
      backgroundColor: Color.fromRGBO(246, 248, 248, 1),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/wave_design_image.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Image.asset(
                  "assets/wave_design_image.png",
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _editProfilePicture();
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: profileImagePath != null
                              ? AssetImage(profileImagePath!)
                              : null,
                          child: profileImagePath == null
                              ? Icon(Icons.person, size: 30)
                              : null,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Username',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            selected: DrawerSelector == "Appointments",
            leading: Icon(Icons.calendar_month),
            title: Text("Appointments"),
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            onTap: () {
              setState(() {
                DrawerSelector = "Appointments";
              });
              widget.updateSelectedUser("Appointments");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Material(
                    child: ScheduleScreen(),
                  ),
                ),
              );
            },
          ),
          ListTile(
            selected: DrawerSelector == "doctor",
            leading: Icon(Icons.search),
            title: Text("Search Doctor"),
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            onTap: () {
              setState(() {
                DrawerSelector = "doctor";
              });
              widget.updateSelectedUser("doctor");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FindDoctor()),
              );
            },
          ),
          ListTile(
            selected: DrawerSelector == "hospital",
            leading: Icon(Icons.local_hospital),
            title: Text("Search Hospitals"),
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            onTap: () {
              setState(() {
                DrawerSelector = "hospital";
              });
              widget.updateSelectedUser("hospital");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HospitalListScreen()),
              );
            },
          ),
          ListTile(
            selected: DrawerSelector == "payment",
            leading: Icon(Icons.payment),
            title: Text("Payment"),
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            onTap: () {
              setState(() {
                DrawerSelector = "payment";
              });
              widget.updateSelectedUser("payment");
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PaymentPage(
                          totalPrice: 1,
                        )),
              );
            },
          ),
          ListTile(
            selected: DrawerSelector == "AnswerQuestions",
            leading: Icon(Icons.question_answer),
            title: Text("Answer Questions"),
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            onTap: () {
              setState(() {
                DrawerSelector = "AnswerQuestions";
              });
              widget.updateSelectedUser("AnswerQuestions");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AnswerQuestionsPage()),
              );
            },
          ),
          ListTile(
            selected: DrawerSelector == "feedback",
            leading: Icon(Icons.feedback),
            title: Text("Feedback"),
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            onTap: () {
              setState(() {
                DrawerSelector = "feedback";
              });
              widget.updateSelectedUser("feedback");
              _showFeedbackDialog(context);
            },
          ),
          ListTile(
            selected: DrawerSelector == "Policy",
            leading: Icon(Icons.policy),
            title: Text("Our Policy"),
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            onTap: () {
              setState(() {
                DrawerSelector = "Policy";
              });
              widget.updateSelectedUser("Policy");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Material(
                    child: PrivacyPolicy(),
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            onTap: () {
              logout();
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text("Share to Friend"),
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            onTap: () {
              shareToFriend();
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text("Contact Us"),
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            onTap: () {
              contactUs();
            },
          ),
        ],
      ),
    );
  }
}

void _editProfilePicture() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    setState(() {
      _profilePic = File(pickedFile.path);
    });
  }
}

File? _profilePic;

Future<void> _editProfilePic() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    setState(() {
      _profilePic = File(pickedFile.path);
    });
  }
}

void setState(Null Function() param0) {}

Widget buildTextField(String labelText, String placeholder,
    Function(String) onChanged, TextInputType number,
    {required int maxLines}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        onChanged: onChanged,
      ),
    ),
  );
}
