// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, sized_box_for_whitespace

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_flutter/Components/ButtonComp.dart';
import 'package:test_flutter/Components/CircleDropdownComp.dart';
import 'package:test_flutter/Components/DropDownReceipients.dart';
import 'package:test_flutter/Components/FriendsDropdownComp.dart';
import 'package:test_flutter/Components/InputComponent.dart';
import 'package:test_flutter/Components/PopupButton.dart';
import 'package:test_flutter/Components/Separator.dart';
import 'package:test_flutter/Components/TextAreaComponent.dart';
import 'package:test_flutter/Components/BlurredPopup.dart';

class ReceivedInvitations extends StatefulWidget {
  const ReceivedInvitations({super.key});

  @override
  State<ReceivedInvitations> createState() => _ReceivedInvitationsState();
}

class _ReceivedInvitationsState extends State<ReceivedInvitations> {
  TextEditingController nameController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  int currentStep = 1;
  bool? isAttend = true;
  int adult = 1;
  int child = 0;

  List<String> wishlist = [
    'Crayons and markers.',
    'A cuddly teddy bear.',
    'Princess dresses for her dolls.'
  ];

  void _showPopupAi() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlurredPopup(
          isDismissible: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/');
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text("x",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff9C6BF4),
                          fontFamily: "Bree")),
                ),
              ),
              SvgPicture.asset('assets/Images/GFTLogo.svg',
                  width: 70, height: 70),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xffEAEAF8),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'RSVP Sent!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontFamily: "Bree",
                    ),
                  ),
                ),
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
      backgroundColor: const Color(0XFFEAEAF8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
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
                    padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        "assets/Images/imageTest.jpeg",
                        width: double.infinity,
                        fit: BoxFit
                            .cover, // You can adjust this to change how the image fits
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                if (currentStep == 1)
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Event Details",
                                      style: TextStyle(
                                          fontFamily: "Bree", fontSize: 16)),
                                ],
                              ),
                              SizedBox(height: 15),
                              Text(
                                "We would love you to join us to celebrate Judy’s 6th Birthday!",
                                style: TextStyle(
                                  fontFamily: "EthosNova",
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/Images/calendar-check.svg',
                                    width: 20,
                                    height: 20,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Mon 26, Mar 2025 at 05:00PM",
                                    style: TextStyle(
                                        fontFamily: "EthosNova",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/Images/map-pin.svg',
                                    width: 20,
                                    height: 20,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Montreal, Sainte-Catherine Street",
                                    style: TextStyle(
                                        fontFamily: "EthosNova",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                              SizedBox(height: 40),
                              ButtonComp(
                                buttonText: "Next",
                                backgroundColor: Color(0xFFEAEAF8),
                                borderColor: Color(0xff9C6BF4),
                                textColor: Color(0xff9C6BF4),
                                onPressed: () {
                                  setState(() {
                                    currentStep = 2;
                                  });
                                },
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentStep = 3;
                                  });
                                },
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "View Wishlist",
                                        style: TextStyle(
                                            fontFamily: "Bree",
                                            fontSize: 15,
                                            color: Color(0xff9C6BF4),
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: Color(0xff9C6BF4)),
                                      )
                                    ]),
                              )
                            ])),
                  ),
                if (currentStep == 2)
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
                              Text(
                                "RSVP",
                                style: TextStyle(
                                  fontFamily: "Bree",
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Are you able to attend?",
                                style: TextStyle(
                                  fontFamily: "EthosNova",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isAttend = true;
                                  });
                                },
                                child: SvgPicture.asset(
                                  isAttend == true
                                      ? 'assets/Images/SelectedViolet.svg'
                                      : 'assets/Images/Deselected.svg',
                                  width: 15,
                                  height: 15,
                                ),
                              ),
                              SizedBox(width: 8), // Add spacing between widgets
                              Text(
                                "Yes",
                                style: TextStyle(
                                  fontFamily: "EthosNova",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      20), // Add spacing between "Yes" and the next option
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isAttend = false;
                                  });
                                },
                                child: SvgPicture.asset(
                                  isAttend == false
                                      ? 'assets/Images/SelectedViolet.svg'
                                      : 'assets/Images/Deselected.svg',
                                  width: 15,
                                  height: 15,
                                ),
                              ),
                              SizedBox(width: 8), // Add spacing between widgets
                              Text(
                                "No",
                                style: TextStyle(
                                  fontFamily: "EthosNova",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Adult',
                                style: TextStyle(
                                  fontFamily: "EthosNova",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    adult++;
                                  });
                                },
                                child: SvgPicture.asset(
                                  'assets/Images/Plus.svg',
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                              SizedBox(width: 25),
                              Text(
                                adult.toString(),
                                style: TextStyle(
                                  fontFamily: "EthosNova",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(width: 25),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    adult--;
                                  });
                                },
                                child: SvgPicture.asset(
                                  'assets/Images/Minus.svg',
                                  width: 25,
                                  height: 25,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Child',
                                style: TextStyle(
                                  fontFamily: "EthosNova",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    child++;
                                  });
                                },
                                child: SvgPicture.asset(
                                  'assets/Images/Plus.svg',
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                              SizedBox(width: 25),
                              Text(
                                child.toString(),
                                style: TextStyle(
                                  fontFamily: "EthosNova",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(width: 25),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    child--;
                                  });
                                },
                                child: SvgPicture.asset(
                                  'assets/Images/Minus.svg',
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Send a message to the host',
                            style: TextStyle(
                              fontFamily: "EthosNova",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 5),
                          InputComponent(
                            hintText: "Allergies, host message, etc…",
                            controller: TextEditingController(),
                            minLines: 3,
                            borderColor: Color(0xffE0CFFF),
                            hintTextColor: Color(0xffE0CFFF),
                          ),
                          SizedBox(height: 20),
                          ButtonComp(
                            buttonText: "Send my RSVP",
                            backgroundColor: Color(0xFFEAEAF8),
                            borderColor: Color(0xff9C6BF4),
                            textColor: Color(0xff9C6BF4),
                            onPressed: () {
                              _showPopupAi();
                            },
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentStep = 3;
                              });
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "View Wishlist",
                                    style: TextStyle(
                                        fontFamily: "Bree",
                                        fontSize: 15,
                                        color: Color(0xff9C6BF4),
                                        decoration: TextDecoration.underline,
                                        decorationColor: Color(0xff9C6BF4)),
                                  )
                                ]),
                          )
                        ],
                      ),
                    ),
                  ),
                if (currentStep == 3)
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Wishlist",
                                      style: TextStyle(
                                          fontFamily: "Bree", fontSize: 16)),
                                ],
                              ),
                              SizedBox(height: 15),
                              Text(
                                "Judy loves colorful things, dolls, drawing, and exploring the world around her. She's always full of energy, asking questions, and making up fun stories.",
                                style: TextStyle(
                                  fontFamily: "EthosNova",
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text("Judy's Top 3 Wishlist:",
                                  style: TextStyle(
                                      fontFamily: "Bree", fontSize: 14)),
                              SizedBox(height: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: wishlist.map((item) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            right: 8.0, top: 6.0),
                                        width: 8.0,
                                        height: 8.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xff9C6BF4),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(width: 8.0),
                                      Expanded(
                                        child: Text(
                                          item,
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                              SizedBox(height: 40),
                              ButtonComp(
                                buttonText: "Done",
                                backgroundColor: Color(0xff9C6BF4),
                                borderColor: Color(0xff9C6BF4),
                                textColor: Color(0xFFEAEAF8),
                                onPressed: () {
                                  setState(() {
                                    currentStep = 1;
                                  });
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
