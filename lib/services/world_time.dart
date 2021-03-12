import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name
  String time; //Time of that particular location
  String flag; // url for the assets
  String url; //Location Url for the api

  WorldTime({this.location, this.flag, this.url});

  Future<void> getData() async {
    try {
      //making the request
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);
      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      String offsetmin = data['utc_offset'].substring(4, 6);
      //print(datetime);
      //print(offset);

      //create a datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(
          Duration(hours: int.parse(offset), minutes: int.parse(offsetmin)));
      //print(now);

      //converting to string
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Caught Error : $e');
      time = 'Could Not fetch time ';
    }
  }
}
