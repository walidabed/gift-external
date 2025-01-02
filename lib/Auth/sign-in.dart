import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_flutter/Components/ButtonComp.dart';
import 'package:test_flutter/Components/InputComponent.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                                height: 50), // To give space for the image
                            const Text(
                              "Welcome Back!",
                              style: TextStyle(
                                fontSize: 33,
                                fontFamily: "Bree",
                                color: Color(0xffF4622E),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Please log in to your account",
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
                                    'Or sign in with',
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
                                const Text("Password",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Bree",
                                      color: Color(0xff2B2B2B),
                                    )),
                                const SizedBox(height: 5),
                                InputComponent(
                                  hintText: "********",
                                  controller: TextEditingController(),
                                  backgroundColor: const Color(0xffFEF2E3),
                                  borderColor: const Color(0xffFEF2E3),
                                  radius: 40,
                                  activeRadius: 40,
                                ),
                                Transform.translate(
                                  offset: const Offset(0, -8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/reset-pass');
                                        },
                                        child: const Text("Forgot Password?",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: "EthosNova",
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xffF4622E),
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor:
                                                    Color(0xffF4622E))),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ButtonComp(
                                  buttonText: "Sign In",
                                  onPressed: () {},
                                  radius: 40,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don't have an account? ",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "EthosNova",
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff2B2B2B)
                                              .withOpacity(0.5),
                                        )),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/sign-up');
                                      },
                                      child: const Text("Sign Up",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "EthosNova",
                                            color: Color(0xffF4622E),
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: Color(0xffF4622E),
                                          )),
                                    )
                                  ],
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
