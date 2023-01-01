import 'package:buddylink/homescreen.dart';
import 'package:buddylink/login.dart';
import 'package:buddylink/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'auth.dart';

class AuthStateHandler extends StatelessWidget {
  const AuthStateHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SpinKitRotatingCircle(
            color: Colors.orange,
            size: 50.0,
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error'),
          );
        } else if (snapshot.hasData) {
          return Homescreen();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
