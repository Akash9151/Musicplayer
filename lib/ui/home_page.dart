import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static const platform = const MethodChannel('Getsongslist');
  String _batteryLevel = 'Unknown Song list';


  @override
  void initState() {
    _getSongLists();
  }

  Future<void> _getSongLists() async {
    String batteryLevel;
    try {
      final batteryLevel = await platform.invokeMethod('getSongsList');
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Music Player Home"),
    );
  }
}