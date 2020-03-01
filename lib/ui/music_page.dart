import 'package:flutter/material.dart';

class MusicPage extends StatefulWidget {
  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      drawer: Container(
        color: Colors.amber,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(1000.0)
          ),
          child: Container(
            color: Colors.blue,
          ),
        ),
      ),
      body: Center(child: Text("This is Body."))
    ),
    );
  }
}