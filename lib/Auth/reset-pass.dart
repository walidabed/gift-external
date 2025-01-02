import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_flutter/Components/ButtonComp.dart';
import 'package:test_flutter/Components/InputComponent.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({super.key});

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFE3BC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 90, 20, 20),
          child: SingleChildScrollView(
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                                height: 50), // To give space for the image
                            const Text(
                              "Reset Password",
                              style: TextStyle(
                                fontSize: 33,
                                fontFamily: "Bree",
                                color: Color(0xffF4622E),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Please enter your email address to receive a new password",
                              textAlign: TextAlign
                                  .center, // Center the text within its bounds
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "EthosNova",
                                color: Color(0xff2B2B2B),
                              ),
                            ),

                            const SizedBox(height: 40),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Email Address",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Bree",
                                      color: Color(0xff2B2B2B),
                                    )),
                                const SizedBox(height: 5),
                                InputComponent(
                                  hintText: "john.doe@gmail.com",
                                  controller: TextEditingController(),
                                  backgroundColor: const Color(0xffFEF2E3),
                                  borderColor: const Color(0xffFEF2E3),
                                  radius: 40,
                                  activeRadius: 40,
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                ButtonComp(
                                  buttonText: "Reset My Password",
                                  onPressed: () {},
                                  radius: 40,
                                ),
                                const SizedBox(height: 10),
                                ButtonComp(
                                  buttonText: "Cancel",
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
