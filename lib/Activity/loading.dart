import 'package:flutter/material.dart';
import 'package:overdrop/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String cityInfo = 'Bangalore';
  late String location;
  late String temperature;
  late String humidityInfo;
  late String windSpeed;
  late String descriptionInfo;
  late String mainInfo;
  late String iconDataInfo;

  void startApp(String cityInfo) async {
    Worker instance = Worker(location: cityInfo);
    await instance.getInformation();

    location = instance.location;
    temperature = instance.temperature;
    humidityInfo = instance.humidityInfo;
    windSpeed = instance.windSpeed;
    descriptionInfo = instance.descriptionInfo;
    mainInfo = instance.mainInfo;
    iconDataInfo = instance.iconDataInfo;

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'locationValue': location,
        'temperatureValue': temperature,
        'humidityValue': humidityInfo,
        'windSpeedValue': windSpeed,
        'descriptionValue': descriptionInfo,
        'mainValue': mainInfo,
        'cityValue': cityInfo,
        'iconValue': iconDataInfo,
      });
    });
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map search = (ModalRoute.of(context)?.settings.arguments ?? {}) as Map;
    if (search.isNotEmpty) {
      cityInfo = search['searchText'];
    }
    startApp(cityInfo);
    return Scaffold(
      body: SingleChildScrollView(
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 180,
                ),
                Image.asset(
                  'images/windy.png',
                  height: 240,
                  width: 240,
                ),
                const SizedBox(height: 50,),
                const Text(
                  'OverDrop',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Developed By adityaranjan_dev',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SpinKitWave(
                  color: Colors.white,
                  size: 50.0,
                ),
                const SizedBox(
                  height: 300,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
