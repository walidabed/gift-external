// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:test_flutter/Components/ButtonComp.dart';
import 'package:test_flutter/Components/DropDownMultiSelect.dart';
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
  List<String> selectedValue = [];
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

  TextEditingController dateController =
      TextEditingController(); // New date controller

  // Function to show the Date Picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        // Format the date to 'MM/dd/yyyy' format and update the controller
        dateController.text = DateFormat('MM/dd/yyyy').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFE3BC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                // Added scroll view
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
                          'Invitation',
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Bree',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                        height: 20), // Add space between text and dropdown

                    // Dropdown Component
                    DropDownReceipientsMultiSelect(
                      items: dropdownItems, // Pass the list of items
                      selectedValues:
                          selectedValue, // List to store selected values
                      onChanged: (List<String> selectedItems) {
                        setState(() {
                          // Handle selected items
                          this.selectedValue = selectedItems;
                        });
                      },
                      hint: 'Select Receipients', // Hint for the dropdown
                    ),
                    SizedBox(height: 20),
                    Separator(
                      height: 10,
                      dashWidth: 6,
                      dashSpace: 2,
                      color: Color(0XFFD5D5D5),
                    ),
                    SizedBox(height: 8),
                    Text("Details Required",
                        style: TextStyle(fontFamily: "Bree", fontSize: 16)),
                    SizedBox(height: 13),
                    InputComponent(
                      hintText: "Name",
                      controller: TextEditingController(),
                      backgroundColor: Colors.white,
                      borderColor: Colors.black,
                      textColor: Colors.black,
                      hintTextColor: Colors.black,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                        onTap: () => _selectDate(context),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  dateController.text.isEmpty
                                      ? 'Select Date'
                                      : dateController.text,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: "EthosNova",
                                      fontWeight: FontWeight.w500),
                                ),
                                SvgPicture.asset(
                                  'assets/Images/downChevron.svg',
                                  width: 7,
                                  height: 7,
                                ),
                              ],
                            ),
                          ),
                        )),
                    SizedBox(height: 10),
                    InputComponent(
                      hintText: "Location",
                      controller: TextEditingController(),
                      backgroundColor: Colors.white,
                      borderColor: Colors.black,
                      textColor: Colors.black,
                      hintTextColor: Colors.black,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 10),
                    InputComponent(
                      hintText: "Link",
                      controller: TextEditingController(),
                      backgroundColor: Colors.white,
                      borderColor: Colors.black,
                      textColor: Colors.black,
                      hintTextColor: Colors.black,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 20),
                    Separator(
                      height: 10,
                      dashWidth: 6,
                      dashSpace: 2,
                      color: Color(0XFFD5D5D5),
                    ),

                    SizedBox(height: 8),

                    Text("Choose Image",
                        style: TextStyle(fontFamily: "Bree", fontSize: 16)),
                    SizedBox(height: 13),
                    PopupButton(
                      buttonText: 'AI Generator',
                      onPressed: _showPopupAi,
                      icon: "bot",
                    ),
                    SizedBox(height: 8),
                    PopupButton(
                      buttonText: 'Gft. Templates',
                      onPressed: _showPopupTemplates,
                      icon: "image",
                      isSelected: true,
                    ),
                    SizedBox(height: 8),
                    PopupButton(
                      buttonText: 'Upload',
                      onPressed: _showPopupUpload,
                      icon: "upload",
                    ),
                    SizedBox(height: 20),
                    Separator(
                      height: 10,
                      dashWidth: 6,
                      dashSpace: 2,
                      color: Color(0XFFD5D5D5),
                    ),
                    SizedBox(height: 8),
                    Text("Add Text",
                        style: TextStyle(fontFamily: "Bree", fontSize: 16)),
                    SizedBox(height: 13),
                    Text("Use AI Generator",
                        style: TextStyle(
                            fontFamily: "EthosNova",
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                    SizedBox(height: 3),
                    TextAreaComponent(
                      hintText: 'Type Your Text',
                      controller: messageController,
                      width: double.infinity,
                      minLines: 2,
                    ),
                    SizedBox(height: 20),
                    Text("Customized",
                        style: TextStyle(
                            fontFamily: "EthosNova",
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                    SizedBox(height: 3),
                    TextAreaComponent(
                      hintText: 'Type Your Text',
                      controller: messageController,
                      width: double.infinity,
                      minLines: 2,
                    ),
                    SizedBox(height: 20),
                    Separator(
                      height: 10,
                      dashWidth: 6,
                      dashSpace: 2,
                      color: Color(0XFFD5D5D5),
                    ),
                    SizedBox(height: 8),
                    ButtonComp(
                      buttonText: "Preview",
                      onPressed: () {
                        // Navigate to the Previewgreeting page when the button is pressed
                        Navigator.pushNamed(context, '/previewInvitations');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
