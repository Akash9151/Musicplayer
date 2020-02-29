import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static const platform = const MethodChannel('Getsongslist');


  @override
  void initState() {
    _getSongLists();
  }

  Future<List<dynamic>> _getSongLists() async {
    List<dynamic> batteryLevel;
    try {
      batteryLevel = await platform.invokeMethod('getSongsList');
    } on PlatformException catch (e) {
      batteryLevel = null;
    }
    return batteryLevel;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Music Player'),
        ),
        body: FutureBuilder(
          future: _getSongLists(),
          builder: (BuildContext context, AsyncSnapshot asyncsnapshot){
            if(asyncsnapshot.hasData){
              List<dynamic> _songList = asyncsnapshot.data;
              return ListView.builder(
                  itemCount: _songList.length,
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      title: Text(_songList[index]),
                    );
                  }
              );
            } else{
              return CircularProgressIndicator();
            }

          },
        )
      ),
    );
  }
}