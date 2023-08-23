import 'package:flutter/material.dart';
//import 'dart:convert';
import 'dart:math';
//import 'package:http/http.dart' as http;
import 'package:weather_icons/weather_icons.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cityNames = [
      'Bokaro Steel City',
      'Varanasi',
      'Delhi',
      'Hyderabad',
      'Pune',
      'Ahmedabad',
      'Chennai',
      'Patna',
      'Mumbai',
      'Indore',
      'Tumkur',
      'Bangalore',
      'Jahanabad',
      'London',
      'Paris',
      'New York',
      'Tokyo',
      'Dubai',
      'Barcelona',
      'Rome',
      'Madrid',
      'Beijing',
      'Mexico',
      'Kolkata',
      'Bangkok',
      'Chicago',
      'Hong Kong',
      'Gurgaon'
    ];
    final _random = Random();
    var city = cityNames[_random.nextInt(cityNames.length)];

    Map information = ModalRoute.of(context)?.settings.arguments as Map;

    String temperature = (information['temperatureValue']).toString();
    String windSpeed = (information['windSpeedValue']).toString();

    String iconDataInfo = (information['iconValue']);
    String cityInfo = (information['cityValue']);
    String humidityInfo = (information['humidityValue']);
    String descriptionInfo = (information['descriptionValue']);
    //String mainInfo = (information['mainValue']);
    if (temperature == 'NA') {
      cityInfo = '';
    } else {
      temperature = temperature.substring(0, 4);
      windSpeed = windSpeed.substring(0, 4);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: NewGradientAppBar(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF2980B9),
              Color(0xFF6DD5FA),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF2980B9),
                  Color(0xFF6DD5FA),
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                //Search Container
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 16.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          if ((searchController.text).replaceAll(' ', '') == '') {
                          } else {
                            Navigator.pushReplacementNamed(
                              context,
                              '/loading',
                              arguments: {
                                'searchText': searchController.text,
                              },
                            );
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(3, 0, 7, 0),
                          child: const Icon(
                            Icons.search,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search $city',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.3),
                        ),
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        child: Row(
                          children: <Widget>[
                            Image.network(
                              'https://openweathermap.org/img/wn/$iconDataInfo@2x.png',
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  '$descriptionInfo',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'In $cityInfo',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.3),
                        ),
                        padding: const EdgeInsets.all(26),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Icon(WeatherIcons.thermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '$temperature',
                                  style: const TextStyle(
                                    fontSize: 90,
                                  ),
                                ),
                                const Text(
                                  'C',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.3),
                        ),
                        padding: const EdgeInsets.all(26),
                        margin: const EdgeInsets.fromLTRB(24, 0, 10, 0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const <Widget>[
                                Icon(WeatherIcons.day_windy),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              '$windSpeed',
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'Km/hr',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.3),
                        ),
                        padding: const EdgeInsets.all(26),
                        margin: const EdgeInsets.fromLTRB(10, 0, 24, 0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const <Widget>[
                                Icon(WeatherIcons.humidity),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              '$humidityInfo',
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'Percent',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const <Widget>[
                      Text(
                        'Developed By adityaranjan_dev',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Data Provided By openweathermap.org',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 200,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
