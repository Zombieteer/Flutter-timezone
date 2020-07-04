import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String time; // time in that location
  String flag; // url to asset flag icon
  String url; // location url for endpoint
  bool isDayTime; // true of false if daytime or not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');

      Map data = jsonDecode(response.body);
      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'].substring(1);

      // creating datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(
          hours: int.parse(offset.substring(0, 2)),
          minutes: int.parse(offset.substring(3))));

      // set time property
      isDayTime = (now.hour > 6 && now.hour <18) ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print(e);
    }
  }
}
