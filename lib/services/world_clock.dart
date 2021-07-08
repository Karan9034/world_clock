import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldClock {
  String location;
  String time;
  String flag;
  String url;
  bool isDay = true;

  WorldClock({
    this.location = '',
    this.time = '',
    this.flag = '',
    this.url = '',
  });

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offsetHours = data['utc_offset'].substring(1, 3);
      String offsetMin = data['utc_offset'].substring(4);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(
        hours: int.parse(offsetHours),
        minutes: int.parse(offsetMin),
      ));

      isDay = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("Error: $e");
      time = "Couldn't fetch time";
    }
  }
}
