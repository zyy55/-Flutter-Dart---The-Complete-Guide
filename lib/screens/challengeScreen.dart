import 'dart:html';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChallengeScreen extends StatefulWidget {
  @override
  _ChallengeScreenState createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firebaseOnMessage();
  }

  void firebaseOnMessage() {
    FirebaseMessaging.onMessage.listen((message) {
      if (message != null) {
        final title = message.notification.title;
        final body = message.notification.body;
        showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                contentPadding: EdgeInsets.all(18),
                children: [
                  Text('Title: $title'),
                  Text('Body: $body'),
                ],
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Challenges'),
      ),
      body: Container(),
    );
  }
}
