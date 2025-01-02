import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_flutter/Components/ButtonComp.dart';
import 'package:test_flutter/Components/InputComponent.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
          // Wrap the entire body with scroll view
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
                              "Ready to Go?",
                              style: TextStyle(
                                fontSize: 33,
                                fontFamily: "Bree",
                                color: Color(0xffF4622E),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Sign up and join the fun",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "EthosNova",
                                color: Color(0xff2B2B2B),
                              ),
                            ),
                            const SizedBox(height: 40),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/Images/Google.svg",
                                ),
                                const SizedBox(width: 10),
                                SvgPicture.asset(
                                  "assets/Images/Apple.svg",
                                ),
                                const SizedBox(width: 10),
                                SvgPicture.asset(
                                  "assets/Images/Meta.svg",
                                )
                              ],
                            ),
                            const SizedBox(height: 40),
                            Center(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 8),
                                      height: 1,
                                      color: const Color(0xff2B2B2B)
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                  Text(
                                    'Or Sign Up with',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "EthosNova",
                                      color: const Color(0xff2B2B2B)
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 8),
                                      height: 1,
                                      color: const Color(0xff2B2B2B)
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 40),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Full Name",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Bree",
                                      color: Color(0xff2B2B2B),
                                    )),
                                const SizedBox(height: 5),
                                InputComponent(
                                  hintText: "John Doe",
                                  controller: TextEditingController(),
                                  backgroundColor: const Color(0xffFEF2E3),
                                  borderColor: const Color(0xffFEF2E3),
                                  radius: 40,
                                  activeRadius: 40,
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),

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

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Password",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Bree",
                                      color: Color(0xff2B2B2B),
                                    )),
                                const SizedBox(height: 5),
                                InputComponent(
                                  hintText: "* * * * * * *",
                                  controller: TextEditingController(),
                                  backgroundColor: const Color(0xffFEF2E3),
                                  borderColor: const Color(0xffFEF2E3),
                                  radius: 40,
                                  activeRadius: 40,
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Confirm Password",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Bree",
                                      color: Color(0xff2B2B2B),
                                    )),
                                const SizedBox(height: 5),
                                InputComponent(
                                  hintText: "* * * * * * *",
                                  controller: TextEditingController(),
                                  backgroundColor: const Color(0xffFEF2E3),
                                  borderColor: const Color(0xffFEF2E3),
                                  radius: 40,
                                  activeRadius: 40,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      accepted = !accepted;
                                    });
                                  },
                                  child: SvgPicture.asset(
                                    !accepted
                                        ? "assets/Images/unchecked.svg"
                                        : "assets/Images/checked.svg",
                                    width: 15,
                                    height: 15,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text("Agreed on",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "EthosNova",
                                      color: const Color(0xff2B2B2B)
                                          .withOpacity(0.5),
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/terms-conditions',
                                        arguments: accepted);
                                  },
                                  child: const Text("Terms & Conditions",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "EthosNova",
                                        color: Color(0xffF4622E),
                                        decoration: TextDecoration.underline,
                                        decorationColor: Color(0xffF4622E),
                                      )),
                                ),
                              ],
                            ),
                            const SizedBox(height: 25),
                            ButtonComp(
                              buttonText: "Sign Up",
                              onPressed: () {},
                              radius: 40,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already a member?",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "EthosNova",
                                      color: const Color(0xff2B2B2B)
                                          .withOpacity(0.5),
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/');
                                  },
                                  child: const Text("Sign in",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "EthosNova",
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffF4622E),
                                        decoration: TextDecoration.underline,
                                        decorationColor: Color(0xffF4622E),
                                      )),
                                )
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
