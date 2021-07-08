import 'package:flutter/material.dart';
import 'package:world_clock/services/world_clock.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldClock> locations = [
    WorldClock(
      url: 'America/Chicago',
      location: 'Chicago',
      flag: 'usa.png',
    ),
    WorldClock(
      url: 'America/Los_Angeles',
      location: 'Los Angeles',
      flag: 'usa.png',
    ),
    WorldClock(
      url: 'America/New_York',
      location: 'New York',
      flag: 'usa.png',
    ),
    WorldClock(
      url: 'Asia/Bangkok',
      location: 'Bangkok',
      flag: 'thailand.png',
    ),
    WorldClock(
      url: 'Asia/Dubai',
      location: 'Dubai',
      flag: 'uae.png',
    ),
    WorldClock(
      url: 'Asia/Kolkata',
      location: 'Kolkata',
      flag: 'india.png',
    ),
    WorldClock(
      url: 'Australia/Sydney',
      location: 'Sydney',
      flag: 'australia.png',
    ),
    WorldClock(
      url: 'Europe/Amsterdam',
      location: 'Amsterdam',
      flag: 'netherlands.png',
    ),
    WorldClock(
      url: 'Europe/Dublin',
      location: 'Dublin',
      flag: 'ireland.png',
    ),
    WorldClock(
      url: 'Europe/London',
      location: 'London',
      flag: 'england.png',
    ),
    WorldClock(
      url: 'Europe/Moscow',
      location: 'Moscow',
      flag: 'russia.png',
    ),
    WorldClock(
      url: 'Europe/Paris',
      location: 'Paris',
      flag: 'france.png',
    ),
    WorldClock(
      url: 'Europe/Rome',
      location: 'Rome',
      flag: 'italy.png',
    ),
  ];

  void updateTime(index) async {
    WorldClock instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'time': instance.time,
      'location': instance.location,
      'flag': instance.flag,
      'isDay': instance.isDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
