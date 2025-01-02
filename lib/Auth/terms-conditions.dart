import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_flutter/Components/ButtonComp.dart';
import 'package:test_flutter/Components/InputComponent.dart';
import 'package:test_flutter/Components/PopupButton.dart';

class Terms extends StatefulWidget {
  const Terms({super.key});

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  bool accepted = false;

  @override
  Widget build(BuildContext context) {
    final bool? argumentAccepted =
        ModalRoute.of(context)?.settings.arguments as bool?;
    if (argumentAccepted != null) {
      accepted = argumentAccepted;
    }

    return Scaffold(
      backgroundColor: const Color(0XFFFFE3BC),
      body: SafeArea(
        child: SingleChildScrollView(
          // Wrap everything in a SingleChildScrollView
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 90, 20, 20),
            child: Column(
              children: [
                Stack(
                  clipBehavior:
                      Clip.none, // Allows the image to extend outside the box
                  children: [
                    // Container (Box)
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                                height: 50), // To give space for the image
                            const Text(
                              "Terms of Use",
                              style: TextStyle(
                                fontSize: 33,
                                fontFamily: "Bree",
                                color: Color(0xffF4622E),
                              ),
                            ),
                            const SizedBox(height: 40),
                            const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '1. Acceptance of Terms',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "EthosNova",
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'By downloading, accessing, or using [App Name] (the “App”), you agree to comply with and be bound by these Terms of Use. If you do not agree to these terms, please do not use the App.',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "EthosNova",
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    '2. Description of Services',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "EthosNova",
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'The App provides tools for managing the sending and receiving of gifts, including: Browsing and selecting gift options.Facilitating purchases and deliveries.Tracking and managing received gifts.The App may include features for personalized gift recommendations and user feedback.',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "EthosNova",
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    '3. Eligibility',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "EthosNova",
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'You must be at least 18 years old or have the consent of a parent or legal guardian to use the App. By using the App, you represent and warrant that you meet these eligibility requirements.',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "EthosNova",
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    '4. User Account',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "EthosNova",
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'To access certain features, you must create an account. You are responsible for maintaining the confidentiality of your login credentials and for all activities under your account.You agree to provide accurate and complete information during registration and to update this information as necessary.',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "EthosNova",
                                      color: Colors.black,
                                    ),
                                  ),
                                ]),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                accepted
                                    ? PopupButton(
                                        buttonText: "Accepted",
                                        radius: 40,
                                        icon: "badge-check",
                                        onPressed: () {
                                          setState(() {
                                            accepted = false;
                                          });
                                          Navigator.pushNamed(
                                              context, '/sign-up',
                                              arguments: accepted);
                                        },
                                      )
                                    : PopupButton(
                                        buttonText: "Accept",
                                        radius: 40,
                                        onPressed: () {
                                          setState(() {
                                            accepted = true;
                                          });
                                          Navigator.pushNamed(
                                              context, '/sign-up',
                                              arguments: accepted);
                                        },
                                      ),
                                ButtonComp(
                                  buttonText: "Go Back",
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  radius: 40,
                                  backgroundColor: const Color(0xffFFE8DB),
                                  borderColor: const Color(0xffFFE8DB),
                                  textColor: const Color(0xffF4622E),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Image (in front of the box)
                    Positioned(
                      top: -65, // Moves the image 35 pixels above the container
                      left: (MediaQuery.of(context).size.width - 120) / 2 -
                          100, // Centering the image
                      child: SvgPicture.asset(
                        'assets/Images/hearts.svg',
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
