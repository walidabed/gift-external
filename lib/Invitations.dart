// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_flutter/Components/ButtonComp.dart';
import 'package:test_flutter/Components/DropDownReceipients.dart';
import 'package:test_flutter/Components/InputComponent.dart';
import 'package:test_flutter/Components/PopupButton.dart';
import 'package:test_flutter/Components/Separator.dart';
import 'package:test_flutter/Components/TextAreaComponent.dart';
import 'package:test_flutter/Components/BlurredPopup.dart'; // Import the BlurredPopup

class Invitations extends StatefulWidget {
  const Invitations({super.key});

  @override
  State<Invitations> createState() => _InvitationsState();
}

class _InvitationsState extends State<Invitations> {
  String? selectedValue; // To hold the selected dropdown value
  TextEditingController nameController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  // List of items for the dropdown
  List<String> dropdownItems = [
    'John Doe',
    'Jane Doe',
    'John Smith',
    'Jane Smith',
  ];

  final List<Map<String, String>> templates = [
    {
      "name": "Birthday",
      "image": "assets/Images/imageTest.jpeg",
    },
    {
      "name": "Good Day",
      "image": "assets/Images/imageTest.jpeg",
    },
    {
      "name": "Good Evening",
      "image": "assets/Images/imageTest.jpeg",
    },
    {
      "name": "Good Night",
      "image": "assets/Images/imageTest.jpeg",
    },
    {
      "name": "Good Night",
      "image": "assets/Images/imageTest.jpeg",
    },
    {
      "name": "Good Night",
      "image": "assets/Images/imageTest.jpeg",
    },
    {
      "name": "Good Night",
      "image": "assets/Images/imageTest.jpeg",
    },
    {
      "name": "Good Night",
      "image": "assets/Images/imageTest.jpeg",
    },
    {
      "name": "Good Night",
      "image": "assets/Images/imageTest.jpeg",
    },
  ];

  String? selectedCategory;

  List<String> Categories = ['Hello', 'Good Day', 'Good Evening', 'Good Night'];

  // Function to show the BlurredPopup
  void _showPopupAi() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlurredPopup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'AI Template Generator',
                style: TextStyle(fontSize: 22, fontFamily: "Bree"),
              ),
              SizedBox(height: 20),
              TextAreaComponent(
                hintText: 'AI Template Generator',
                controller: TextEditingController(),
                backgroundColor: Colors.white,
                borderColor: Colors.black,
              ),
              SizedBox(height: 20),
              ButtonComp(
                buttonText: "Generate",
                onPressed: () {
                  Navigator.of(context).pop(); // Close the popup
                },
              )
            ],
          ),
        );
      },
    );
  }

  void _showPopupTemplates() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlurredPopup(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Gift Templates',
                  style: TextStyle(fontSize: 22, fontFamily: "Bree"),
                ),
                SizedBox(height: 20),
                DropDownReceipients(
                  items: Categories,
                  selectedValue: selectedCategory,
                  onChanged: (value) =>
                      setState(() => selectedCategory = value),
                  hint: "Choose Category",
                ),
                SizedBox(height: 20),
                // Using the ListView to wrap GridView to make height dynamic
                GridView.builder(
                  shrinkWrap:
                      true, // Make the GridView take only as much space as it needs
                  physics:
                      NeverScrollableScrollPhysics(), // Disable internal scrolling
                  itemCount: templates.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of images per row
                    crossAxisSpacing: 10, // Spacing between columns
                    mainAxisSpacing: 10, // Spacing between rows
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(
                                  15), // Rounded corners for the container
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  15), // Apply the same radius to the image
                              child: Image.asset(
                                "assets/Images/imageTest.jpeg", // Load JPEG image from assets
                                fit: BoxFit
                                    .cover, // Fill the container and preserve aspect ratio
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                ButtonComp(
                  buttonText: "Use",
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the popup
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showPopupUpload() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlurredPopup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Upload Template',
                style: TextStyle(fontSize: 22, fontFamily: "Bree"),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
                    child: Column(
                      children: [
                        SvgPicture.asset('assets/Images/upload.svg',
                            width: 40, height: 40),
                        SizedBox(height: 20),
                        Text(
                          'Upload Template',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: "EthosNova",
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )),
              ),
              SizedBox(height: 20),
              ButtonComp(
                buttonText: "Use",
                onPressed: () {
                  Navigator.of(context).pop(); // Close the popup
                },
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFE3BC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Row with text
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/Images/backArrow.svg',
                              width: 25,
                              height: 25,
                            ),
                            const SizedBox(width: 5), // gap
                            const Text(
                              'Invitations',
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'Bree',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                            height: 20), // Add space between text and dropdown

                        InputComponent(
                            hintText: "Event name (e.g., Birthday Party)",
                            controller: TextEditingController()),
                        SizedBox(height: 30),
                        Separator(
                          height: 10,
                          dashWidth: 6,
                          dashSpace: 2,
                          color: Color(0XFFD5D5D5),
                        ),
                        SizedBox(height: 16),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Choose Template",
                                  style: TextStyle(
                                      fontFamily: "Bree", fontSize: 16)),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                      'assets/Images/sliders-horizontal.svg',
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  GestureDetector(
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                      'assets/Images/scan-eye.svg',
                                      width: 20,
                                      height: 20,
                                    ),
                                  )
                                ],
                              )
                            ]),
                        SizedBox(height: 15),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(templates.length, (index) {
                              return Row(
                                children: [
                                  Container(
                                    width: 90,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        "assets/Images/imageTest.jpeg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  // Add a gap after every item except the last
                                  if (index < templates.length - 1)
                                    SizedBox(width: 10),
                                ],
                              );
                            }),
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PopupButton(
                                buttonText: 'Gftee',
                                width:
                                    MediaQuery.of(context).size.width * 0.385,
                                onPressed: _showPopupAi,
                                icon: "Gftee",
                              ),
                              SizedBox(height: 8),
                              PopupButton(
                                buttonText: 'Upload',
                                width:
                                    MediaQuery.of(context).size.width * 0.385,
                                onPressed: _showPopupTemplates,
                                icon: "upload",
                              ),
                            ]),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Event Details",
                                    style: TextStyle(
                                        fontFamily: "Bree", fontSize: 16)),
                                Text("Step" + " 2 " + "of 2",
                                    style: TextStyle(
                                        fontFamily: "EthosNova",
                                        fontSize: 12,
                                        color: Color(0xff808080)))
                              ],
                            ),
                            SizedBox(height: 15),
                            Separator(
                              height: 10,
                              dashWidth: 6,
                              dashSpace: 2,
                              color: Color(0XFFD5D5D5),
                            ),
                            SizedBox(height: 12),
                            InputComponent(
                              hintText: "Write a message",
                              controller: TextEditingController(),
                              minLines: 4,
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              child: Center(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Color(0XFFF4622E),
                                              width: 1.5,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          "Let Gftee ",
                                          style: TextStyle(
                                            fontFamily: "Bree",
                                            fontSize: 14,
                                            color: Color(0XFFF4622E),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 2),
                                      SvgPicture.asset(
                                        "assets/Images/OrangeGftee.svg",
                                        width: 20,
                                        height: 20,
                                      ),
                                      SizedBox(width: 5),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Color(0XFFF4622E),
                                              width: 1.5,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          "Write",
                                          style: TextStyle(
                                            fontFamily: "Bree",
                                            fontSize: 14,
                                            color: Color(0XFFF4622E),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            SizedBox(height: 18),
                            ButtonComp(
                              buttonText: "Next",
                              onPressed: () {
                                // Navigate to the Previewgreeting page when the button is pressed
                                Navigator.pushNamed(
                                    context, '/previewInvitations');
                              },
                            ),
                          ])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
