import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/weather_Cubit.dart';

class searchpage extends StatelessWidget {
  String? city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a city"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              city = value;
            
            BlocProvider.of<WeatherCubit>(context)
            .getWeather(city: city!);
             BlocProvider.of<WeatherCubit>(context)
            .cityName=city;
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
                hintText: "Enter a city",
                contentPadding:
                    EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
                label: Text("search")),
          ),
        ),
      ),
    );
  }
}
