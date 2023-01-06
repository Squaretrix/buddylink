import 'dart:html';

import 'package:buddylink/auth.dart';
import 'package:buddylink/open_contact_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    TextEditingController searchbarController = new TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contacts"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
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
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: db
                      .collection('accounts')
                      .doc(AuthService().user!.uid)
                      .collection('contacts')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else
                      return ListView(
                        children: snapshot.data!.docs.map((doc) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      OpenContactPage(id: doc.id),
                                ),
                              );
                            },
                            child: Card(
                              child: ListTile(
                                title: Text(doc['firstname']),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
