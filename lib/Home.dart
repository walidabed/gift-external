// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_flutter/Components/BlurredPopup.dart';
import 'package:test_flutter/Components/ButtonComp.dart';
import 'package:test_flutter/Components/DropDownReceipients.dart';
import 'package:test_flutter/Components/PopupButton.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _ShowGreetingsCategory() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlurredPopup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Choose Category',
                style: TextStyle(fontSize: 22, fontFamily: "Bree"),
              ),
              SizedBox(height: 20),
              DropDownReceipients(
                  items: ["Birthday", "Ramadan", "Mothers Day", "Christmas"],
                  selectedValue: null,
                  onChanged: (selectedValue) {},
                  hint: "Select Category"),
              SizedBox(height: 20),
              ButtonComp(
                buttonText: "Next",
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/Greetings');
                },
              )
            ],
          ),
        );
      },
    );
  }

  void _ShowInvitationsCategory() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlurredPopup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Choose Category',
                style: TextStyle(fontSize: 22, fontFamily: "Bree"),
              ),
              SizedBox(height: 20),
              DropDownReceipients(
                  items: ["Birthday", "Ramadan", "Mothers Day", "Christmas"],
                  selectedValue: null,
                  onChanged: (selectedValue) {},
                  hint: "Select Category"),
              SizedBox(height: 20),
              ButtonComp(
                buttonText: "Next",
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/Invitations');
                },
              )
            ],
          ),
        );
      },
    );
  }

  void _showNewInvitation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlurredPopup(
          isDismissible: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/Images/GFTLogo.svg',
                  width: 70, height: 70),
              SizedBox(height: 10),
              Text(
                "Cheers!",
                style: TextStyle(
                    fontSize: 33, fontFamily: "Bree", color: Color(0xff9C6BF4)),
              ),
              Text(
                "You’ve received an invitation.",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "EthosNova",
                    color: Color(0xff2B2B2B)),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/Images/background.png'), // Replace with your image path
                    fit: BoxFit.cover, // Adjust to fit the container
                  ),
                ),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 100),
                    child: Stack(
                      alignment:
                          Alignment.center, // Center the SVG over the Row
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                "assets/Images/male.png",
                                width: 135,
                                height: 135,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                                width:
                                    5), // Space for the SVG in the Row layout
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                "assets/Images/female.png",
                                width: 135,
                                height: 135,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          child: SvgPicture.asset(
                            'assets/Images/trans.svg',
                            width: 40, // Adjust the size of the SVG
                            height: 40,
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(height: 20),
              ButtonComp(
                buttonText: "Check it out",
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/ReceivedInvitations');
                },
                backgroundColor: Color(0xff9C6BF4),
                borderColor: Color(0xff9C6BF4),
                textColor: Colors.white,
              ),
              SizedBox(height: 10),
              ButtonComp(
                buttonText: "Go To Home Page",
                onPressed: () {
                  Navigator.of(context).pop();
                },
                backgroundColor: Color(0xffE0CFFF),
                borderColor: Color(0xffE0CFFF),
                textColor: Color(0xff9C6BF4),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showNewInvitation();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PopupButton(
                    buttonText: "Greetings",
                    onPressed: () => {_ShowGreetingsCategory()}),
                SizedBox(height: 20),
                PopupButton(
                    buttonText: "Invitations",
                    onPressed: () => {_ShowInvitationsCategory()}),
                PopupButton(
                    buttonText: "Greetings",
                    onPressed: () =>
                        {Navigator.pushNamed(context, '/ReceivedInvitations')}),
              ]),
        ),
      ),
    );
  }
}
