//import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/weather_Cubit.dart';
import 'package:weather_app/Cubit/weather_State.dart';
import 'package:weather_app/models/weatherModel.dart';
import 'package:weather_app/pages/searchpage.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return searchpage();
                }),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
        title: const Text('Weather App'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
         if (state is IsLoading){
          return Center(child: CircularProgressIndicator(),);
         }
         else if( state is Success){
          weatherData= BlocProvider.of<WeatherCubit>(context).weatherModel;
           
           return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  weatherData!.getThemeColor(),
                  weatherData!.getThemeColor()[300]!,
                  weatherData!.getThemeColor()[100]!,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                  
                   BlocProvider.of<WeatherCubit>(context).cityName!,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                   // 'updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
                   "",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getImage()),
                      Text(
                      // weatherData!.temp.toInt().toString(),
                        "",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: [
                          Text('maxTemp :${weatherData!.maxTemp.toInt()}'),
                          Text('minTemp : ${weatherData!.minTemp.toInt()}'),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    weatherData!.weatherStateName,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                ],
              ),
            );
         }
         else if(state is Failure){
          return Center(child: Text("Something is Wrong .. Try again !!"));
         }
        else{
          return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            );
        }
         },
      ),

   
    );
  }
}
