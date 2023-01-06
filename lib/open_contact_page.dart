import 'package:flutter/material.dart';

class OpenContactPage extends StatefulWidget {
  String id = '';
  OpenContactPage(String id) {
    this.id = id;
  }
  @override
  State<OpenContactPage> createState() => _OpenContactPageState();
}

class _OpenContactPageState extends State<OpenContactPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(widget.id),
      ),
    ));
  }
}
