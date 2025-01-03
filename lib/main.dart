// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_flutter/Auth/reset-pass.dart';
import 'package:test_flutter/Auth/sign-in.dart';
import 'package:test_flutter/Auth/sign-up.dart';
import 'package:test_flutter/Auth/terms-conditions.dart';
import 'package:test_flutter/Home.dart';
import 'package:test_flutter/Invitations.dart';
import 'package:test_flutter/PreviewGreeting.dart';
import 'package:test_flutter/PreviewInvitations.dart';
import 'package:test_flutter/ReceivedInvitations.dart';
import 'package:test_flutter/greetings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/', // Set the initial route of your app
      routes: {
        '/': (context) => SignIn(),
        '/sign-up': (context) => SignUp(),
        '/terms-conditions': (context) => Terms(),
        '/reset-pass': (context) => ResetPass(),
        '/home': (context) => Home(),
        '/Invitations': (context) => Invitations(), // The Greetings page route
        '/previewGreetings': (context) => PreviewGreetings(),
        '/ReceivedInvitations': (context) => ReceivedInvitations(),
        '/Greetings': (context) => Greetings(),
        '/previewInvitations': (context) =>
            PreviewInvitations(), // Route to Previewgreeting
      },
    );
  }
}
