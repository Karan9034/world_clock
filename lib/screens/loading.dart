import 'package:flutter/material.dart';
import 'package:world_clock/services/world_clock.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldClock() async {
    WorldClock instance = WorldClock(
      location: 'Kolkata',
      url: 'Asia/Kolkata',
      flag: 'india.png',
    );
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'time': instance.time,
      'location': instance.location,
      'flag': instance.flag,
      'isDay': instance.isDay,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldClock();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitThreeBounce(
          size: 30,
          color: Colors.white,
        ),
        // child: Text('Loading...'),
      ),
    );
  }
}
