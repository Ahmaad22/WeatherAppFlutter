import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/weather_Cubit.dart'; // Import your Cubit class
import 'package:weather_app/pages/home_page.dart'; // Import your HomePage widget
import 'package:weather_app/services/weather_service.dart'; // Import your WeatherService

void main() {
  runApp(
    BlocProvider(
      create: (context) => WeatherCubit(Weather()), 
      child: WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherModel == null ?  Colors.blue : BlocProvider.of<WeatherCubit>(context).weatherModel!.getThemeColor()  ,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
