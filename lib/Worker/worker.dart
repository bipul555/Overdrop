import 'package:http/http.dart' as http;
import 'dart:convert';

class Worker {
  late String location;
  late String temperature;
  late String humidityInfo;
  late String windSpeed;
  late String descriptionInfo;
  late String mainInfo;
  late String iconData;

  //Constructor
  Worker({required this.location});

  late String iconDataInfo;

  Future<void> getInformation() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=48c084dccdf046d0c08e590210fcb556'),
      );
      Map data = jsonDecode(response.body);

      //Receiving temperature and humidity from 'main' map
      Map main = data['main'];
      double temp = main['temp'] - 273.15;
      String humidity = main['humidity'].toString();

      //Receiving wind speed from 'wind' map
      Map wind = data['wind'];
      double speed = wind['speed'] / 0.227777777777778;

      //Receiving main and description from 'weather' map
      List weatherList = data['weather'];
      Map weatherListMap = weatherList[0];
      String mainData = weatherListMap['main'];
      String description = weatherListMap['description'];

      //Assigning values to the properties
      temperature = temp.toString();
      humidityInfo = humidity.toString();
      windSpeed = speed.toString();
      if (temperature == 'NA') {
      } else {
        temperature = temperature.substring(0, 4);
        windSpeed = windSpeed.substring(0, 4);
      }
      descriptionInfo = description;
      mainInfo = mainData;
      iconDataInfo = weatherListMap['icon'];
    } catch (e) {
      temperature = 'NA';
      humidityInfo = 'NA';
      windSpeed = 'NA';
      descriptionInfo = 'Invalid City';
      mainInfo = 'NA';
      iconDataInfo = '03n';
    }
  }
}
