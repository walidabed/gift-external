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

  @override
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
                    onPressed: () => {_ShowInvitationsCategory()})
              ]),
        ),
      ),
    );
  }
}
