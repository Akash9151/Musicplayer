import 'package:flutter/material.dart';
import 'package:musicplayer/ui/drawer_design.dart';

class MusicPage extends StatefulWidget {
  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Title"),
      ),
      drawer: DrawerDesing(scaffoldKey: _scaffoldKey, child: Text("data"),),
      body: Center(child: Text("This is Body."))
    ),
    );
  }
}