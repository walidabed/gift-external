// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, sized_box_for_whitespace

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

class Invitations extends StatefulWidget {
  const Invitations({super.key});

  @override
  State<Invitations> createState() => _InvitationsState();
}

class _InvitationsState extends State<Invitations> {
  String? selectedValue;
  TextEditingController nameController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  Object? selectedTemplate;
  int currentStep = 1;
  DateTime? selectedDate;

  List<String> dropdownItems = [
    'John Doe',
    'Jane Doe',
    'John Smith',
    'Jane Smith',
  ];

  final List<Map<String, String>> templates = [
    {
      "id": "1",
      "name": "Birthday",
      "image": "assets/Images/imageTest.jpeg",
    },
    {
      "id": "2",
      "name": "Good Day",
      "image": "assets/Images/imageTest.jpeg",
    },
    {
      "id": "3",
      "name": "Good Evening",
      "image": "assets/Images/imageTest.jpeg",
    },
    {
      "id": "4",
      "name": "Good Night",
      "image": "assets/Images/imageTest.jpeg",
    },
    {
      "id": "5",
      "name": "Good Night",
      "image": "assets/Images/imageTest.jpeg",
    },
    {
      "id": "6",
      "name": "Good Night",
      "image": "assets/Images/imageTest.jpeg",
    },
    {
      "id": "7",
      "name": "Good Night",
      "image": "assets/Images/imageTest.jpeg",
    },
    {
      "id": "8",
      "name": "Good Night",
      "image": "assets/Images/imageTest.jpeg",
    },
    {
      "id": "9",
      "name": "Good Night",
      "image": "assets/Images/imageTest.jpeg",
    },
  ];

  String? selectedCategory;

  List<String> Categories = ['Hello', 'Good Day', 'Good Evening', 'Good Night'];

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
                  Navigator.of(context).pop();
                },
              )
            ],
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
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      },
    );
  }

  void _showPopupReceipients() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlurredPopup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Select Receipients',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Bree',
                  ),
                ),
              ),
              SizedBox(height: 10),
              CircleDropdownComp(
                items: ["Family", "Work", "Friends"],
                hintText: "Your Circles",
                isMulti: true,
              ),
              FriendsDropdownComp(
                items: ["John Doe", "Jane Doe", "John Smith", "Jane Smith"],
                hintText: "Your Friends",
                isMulti: true,
              ),
              SizedBox(height: 20),
              ButtonComp(
                buttonText: "Done",
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      },
    );
  }

  void _showPopupFiltartion() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlurredPopup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Filter By",
                  style: TextStyle(fontSize: 22, fontFamily: "Bree")),
              FriendsDropdownComp(items: [
                "Birthday",
                "Ramadan",
                "Mothers Day",
                "Christmas",
                "Teachers Day"
              ], hintText: " Type"),
              FriendsDropdownComp(
                  items: ["Red", "Blue", "Green", "Purple", "Yellow", "Black"],
                  hintText: "Color"),
              SizedBox(height: 20),
              ButtonComp(
                buttonText: "Done",
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _showDatePickerDialog() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Color(0xffF4622E),
            primaryColorDark: Color(0xffD1481B),
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
            colorScheme: ColorScheme.light(
              primary: Color(0xffF4622E),
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void _showMapDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.8,
            child: FlutterMap(
              options: MapOptions(),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
              ],
            ),
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/Images/backArrow.svg',
                              width: 25,
                              height: 25,
                            ),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/');
                              },
                              child: const Text(
                                'Invitations',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Bree',
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
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
                                    onTap: () {
                                      _showPopupFiltartion();
                                    },
                                    child: SvgPicture.asset(
                                      'assets/Images/sliders-horizontal.svg',
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/previewInvitations');
                                    },
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
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedTemplate = index;
                                      });
                                    },
                                    child: Container(
                                      width: 90,
                                      height: 140,
                                      decoration: BoxDecoration(
                                        border: selectedTemplate == index
                                            ? Border.all(
                                                color: Colors.black, width: 1.5)
                                            : null,
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
                                  ),
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
                                onPressed: _showPopupUpload,
                                icon: "upload",
                              ),
                            ]),
                      ],
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
                                  Text(
                                      "Step " +
                                          currentStep.toString() +
                                          " of 3",
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
                                  child: GestureDetector(
                                    onTap: () => {_showPopupAi()},
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                              ),
                              SizedBox(height: 18),
                              ButtonComp(
                                buttonText: "Next",
                                onPressed: () {
                                  setState(() {
                                    currentStep = 2;
                                  });
                                },
                              ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Event Details",
                                      style: TextStyle(
                                          fontFamily: "Bree", fontSize: 16)),
                                  Text("Step" + " 2 " + "of 3",
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
                              PopupButton(
                                buttonText: "Select Date",
                                onPressed: () {
                                  _showDatePickerDialog();
                                },
                                width: double.infinity,
                                icon: "calendar-check",
                                backgroundColor: Color(0xffFFE8DB),
                                textColor: Color(0xffF4622E),
                                iconColor: Color(0xffF4622E),
                                borderColor: Color(0xffF4622E),
                              ),
                              SizedBox(height: 10),
                              PopupButton(
                                buttonText: "Location",
                                onPressed: () {
                                  _showMapDialog();
                                },
                                width: double.infinity,
                                icon: "map-pin",
                                backgroundColor: Color(0xffFFE8DB),
                                textColor: Color(0xffF4622E),
                                iconColor: Color(0xffF4622E),
                                borderColor: Color(0xffF4622E),
                              ),
                              SizedBox(height: 60),
                              ButtonComp(
                                buttonText: "Next",
                                onPressed: () {
                                  setState(() {
                                    currentStep = 3;
                                  });
                                },
                              ),
                            ])),
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
                                  Text("Event Details",
                                      style: TextStyle(
                                          fontFamily: "Bree", fontSize: 16)),
                                  Text("Step" + " 3 " + "of 3",
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
                              PopupButton(
                                buttonText: "Select Receipient",
                                onPressed: () {
                                  _showPopupReceipients();
                                },
                                width: double.infinity,
                                icon: "user-round-plus",
                                backgroundColor: Color(0xffFFE8DB),
                                textColor: Color(0xffF4622E),
                                iconColor: Color(0xffF4622E),
                                borderColor: Color(0xffF4622E),
                              ),
                              SizedBox(height: 10),
                              PopupButton(
                                buttonText: "Add a Wishlist",
                                onPressed: () {},
                                width: double.infinity,
                                icon: "heart",
                                backgroundColor: Color(0xffFFE8DB),
                                textColor: Color(0xffF4622E),
                                iconColor: Color(0xffF4622E),
                                borderColor: Color(0xffF4622E),
                              ),
                              SizedBox(height: 60),
                              ButtonComp(
                                buttonText: "Next",
                                onPressed: () {
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
