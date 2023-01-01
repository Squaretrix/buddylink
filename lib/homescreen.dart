import 'package:buddylink/authstatehandler.dart';
import 'package:buddylink/contact_page.dart';
import 'package:buddylink/create_contact_page.dart';
import 'package:buddylink/dbhandler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    final List<String> items = ['item 1', 'item 2', 'item 3'];

    TextEditingController searchbarController = new TextEditingController();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(AuthService().user!.uid),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => ContactPage(),
                  ),
                );
              },
              icon: Icon(Icons.contacts_rounded)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const CreateContactPage(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.person_add_alt_rounded,
                  color: Colors.white,
                )),
          ),
          IconButton(
              onPressed: () async {
                await AuthService().signOut();
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const AuthStateHandler(),
                  ),
                );
              },
              icon: Icon(Icons.logout_rounded))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: searchbarController,
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: "Search...",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Anstehende Events'),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(items[index]),
                    ),
                  );
                },
              ),
            ),
            Text('Anstehende Events'),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(items[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
