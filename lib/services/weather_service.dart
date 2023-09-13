import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weatherModel.dart';
class Weather{
  String baseurl= "http://api.weatherapi.com/v1";
  String apiKey ="753bf8ec6db54313aa8170512232407";
  Future<WeatherModel> getweather({required String city})async{
    Uri url =Uri.parse("$baseurl/forecast.json?key=$apiKey&q=$city&aqi=no");

    http.Response response= await http.get(url);
Map<String,dynamic> dataFromApi=jsonDecode(response.body);

WeatherModel weatherObject = WeatherModel.fromJson(dataFromApi);
return weatherObject;
  }
}