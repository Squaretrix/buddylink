import 'package:buddylink/register.dart';
import 'package:flutter/material.dart';

import 'auth.dart';
import 'homescreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('BuddyLink'),
            SizedBox(
              height: 80,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      blurRadius: 16,
                      spreadRadius: 3,
                      offset: Offset(0, 4)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: TextFormField(
                  controller: emailController,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email_outlined),
                    label: Text('Email'),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      blurRadius: 16,
                      spreadRadius: 3,
                      offset: Offset(0, 4)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: TextFormField(
                  controller: passwordController,
                  autocorrect: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock_outline_rounded),
                    label: Text('Passwort'),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () async {
                await AuthService().signInWithEmailAndPassword(
                    emailController.text, passwordController.text);

                     Navigator.pushReplacement<void, void>(
                         context,
                         MaterialPageRoute<void>(
                           builder: (BuildContext context) =>
                               const Homescreen(),
                         ),
                       );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text(
                        'Einloggen',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
              ),
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement<void, void>(
                         context,
                         MaterialPageRoute<void>(
                           builder: (BuildContext context) =>
                               const RegisterPage(),
                         ),
                       );
              },
              child: Text('Stattdessen Registrieren'),
            ),
          ],
        ),
      ),
    ));
  }
}
