// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_flutter/Components/ButtonComp.dart';

class PreviewGreetings extends StatefulWidget {
  const PreviewGreetings({super.key});

  @override
  State<PreviewGreetings> createState() => _PreviewGreetingsState();
}

class _PreviewGreetingsState extends State<PreviewGreetings> {
  String? selectedValue; // To hold the selected dropdown value
  TextEditingController nameController = TextEditingController();
  TextEditingController messageController = TextEditingController();

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
                          'Greetings',
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
                    Container(
                      height: 500,
                      width: double.infinity,
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
                    ),
                    SizedBox(height: 20),
                    const Text(
                      'Your card looks perfect!',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Bree',
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Receipient: ",
                              style: TextStyle(
                                  fontFamily: 'EthosNova',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12),
                            ),
                            Text(
                              "Date: ",
                              style: TextStyle(
                                  fontFamily: 'EthosNova',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12),
                            ),
                            Text(
                              "Category: ",
                              style: TextStyle(
                                  fontFamily: 'EthosNova',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(width: 30),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "John Doe",
                                style: TextStyle(
                                    fontFamily: 'EthosNova', fontSize: 12),
                              ),
                              Text(
                                "2023-08-10",
                                style: TextStyle(
                                    fontFamily: 'EthosNova', fontSize: 12),
                              ),
                              Text(
                                "Birthday",
                                style: TextStyle(
                                    fontFamily: 'EthosNova', fontSize: 12),
                              )
                            ]),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonComp(
                            width: MediaQuery.of(context).size.width * 0.375,
                            buttonText: "Go Back",
                            onPressed: () {
                              Navigator.pushNamed(context, '/');
                            },
                            backgroundColor: Colors.white,
                            textColor: Color(0xffF4622E),
                            fontSize: 12,
                          ),
                          ButtonComp(
                            width: MediaQuery.of(context).size.width * 0.375,
                            buttonText: "Preview & Send",
                            onPressed: () {},
                            fontSize: 12,
                          ),
                        ])
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
