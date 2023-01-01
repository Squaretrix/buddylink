import 'package:buddylink/authstatehandler.dart';
import 'package:buddylink/dbhandler.dart';
import 'package:flutter/material.dart';

import 'auth.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(AuthService().user!.uid),
            IconButton(
                onPressed: () async {
                  await AuthService().signOut();
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const AuthStateHandler(),
                    ),
                  );
                },
                icon: Icon(Icons.logout_rounded))
          ],
        ),
      ),
    ));
  }
}
