import 'dart:io';
import 'package:flutter/material.dart';
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
                buildTextField('First Name', firstName, (value) {
                  setState(() {
                    firstName = value;
                  });
                }),
                buildTextField('Last Name', lastName, (value) {
                  setState(() {
                    lastName = value;
                  });
                }),
                buildTextField('Prefix', prefix, (value) {
                  setState(() {
                    prefix = value;
                  });
                }),
                buildTextField('Specialty', specialty, (value) {
                  setState(() {
                    specialty = value;
                  });
                }),
                buildTextField('Medical Education', medicalEducation, (value) {
                  setState(() {
                    medicalEducation = value;
                  });
                }),
                buildTextField('Residency', residency, (value) {
                  setState(() {
                    residency = value;
                  });
                }),
                buildTextField('Internship', internship, (value) {
                  setState(() {
                    internship = value;
                  });
                }),
                buildTextField('Fellowship', fellowship, (value) {
                  setState(() {
                    fellowship = value;
                  });
                }),
                buildTextField('Biography', biography, (value) {
                  setState(() {
                    biography = value;
                  });
                }),
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
      appBar: AppBar(
        // Customize your app bar here
        title: Text('Hospital Service'),
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
              GestureDetector(
                onTap: () {
                  _editProfilePicture();
                },
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: profileImagePath != null
                      ? AssetImage(profileImagePath!)
                      : null,
                  child: profileImagePath == null
                      ? Icon(Icons.person, size: 80)
                      : null,
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
              ),

              // TextField(
              //   controller: TextEditingController(text: prefix),
              //   onChanged: (value) {
              //     prefix = value;
              //   },
              //   decoration: InputDecoration(
              //     labelText: 'Prefix',
              //   ),
              // ),
              TextField(
                controller: TextEditingController(text: firstName),
                onChanged: (value) {
                  firstName = value;
                },
                decoration: InputDecoration(
                  labelText: 'First Name',
                ),
              ),
              TextField(
                controller: TextEditingController(text: lastName),
                onChanged: (value) {
                  lastName = value;
                },
                decoration: InputDecoration(
                  labelText: 'Last Name',
                ),
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(
                  labelText: 'Age',
                ),
              ),
              // TextField(
              //   controller: specializationController,
              //   decoration: InputDecoration(
              //     labelText: 'Specialization',
              //   ),
              // ),
              TextField(
                controller: TextEditingController(text: specialty),
                onChanged: (value) {
                  specialty = value;
                },
                decoration: InputDecoration(
                  labelText: 'Specialization',
                ),
              ),
              TextField(
                controller: TextEditingController(text: rank.toString()),
                onChanged: (value) {
                  rank = int.tryParse(value) ?? 1;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Rank',
                ),
              ),
              TextField(
                controller: TextEditingController(text: medicalEducation),
                onChanged: (value) {
                  medicalEducation = value;
                },
                decoration: InputDecoration(
                  labelText: 'Medical Education',
                ),
              ),
              TextField(
                controller: TextEditingController(text: residency),
                onChanged: (value) {
                  residency = value;
                },
                decoration: InputDecoration(
                  labelText: 'Residency',
                ),
              ),
              TextField(
                controller: TextEditingController(text: internship),
                onChanged: (value) {
                  internship = value;
                },
                decoration: InputDecoration(
                  labelText: 'Internship',
                ),
              ),
              TextField(
                controller: TextEditingController(text: fellowship),
                onChanged: (value) {
                  fellowship = value;
                },
                decoration: InputDecoration(
                  labelText: 'Fellowship',
                ),
              ),
              TextField(
                controller: TextEditingController(text: biography),
                onChanged: (value) {
                  biography = value;
                },
                decoration: InputDecoration(
                  labelText: 'Biography',
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
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
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Update',
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
    return Drawer(
      backgroundColor: Color.fromRGBO(246, 248, 248, 1),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () async {
                    final updatedProfilePic = await Navigator.push<File?>(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProfilePage(updatedProfilePic: _profilePic),
                      ),
                    );

                    if (updatedProfilePic != null) {
                      setState(() {
                        _profilePic = updatedProfilePic;
                      });
                    }
                  },
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Color.fromARGB(255, 35, 159, 231),
                    backgroundImage:
                        _profilePic != null ? FileImage(_profilePic!) : null,
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
          ListTile(
            selected: DrawerSelector == "Appointments",
            leading: Icon(Icons.calendar_month),
            title: Text("Appointments"),
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            onTap: () {
              setState(() {
                DrawerSelector = "Appointments";
              });
              widget.updateSelectedUser(DrawerSelector);
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
              widget.updateSelectedUser(DrawerSelector);
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
              widget.updateSelectedUser(DrawerSelector);
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
              widget.updateSelectedUser(DrawerSelector);
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
            title: Text(
                "Answer Questions"), // Change the title to "Answer Questions"
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            onTap: () {
              setState(() {
                DrawerSelector =
                    "AnswerQuestions"; // Change the selector to "AnswerQuestions"
              });
              widget.updateSelectedUser(DrawerSelector);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AnswerQuestionsPage()), // Navigate to AnswerQuestionsPage
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
              widget.updateSelectedUser(DrawerSelector);
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
              widget.updateSelectedUser(DrawerSelector);
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
          Expanded(child: Container()),
          Divider(thickness: 1),
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

Widget buildTextField(
  String labelText,
  String placeholder,
  Function(String) onChanged,
) {
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
