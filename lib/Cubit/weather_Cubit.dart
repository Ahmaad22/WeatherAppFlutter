import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/weather_State.dart';
import 'package:weather_app/models/weatherModel.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weather) : super(WeatherInitial());
  String? cityName;
  final Weather weather;
  WeatherModel? weatherModel;

  void getWeather({required String city}) async {
    emit(IsLoading());
    try {
      weatherModel = await weather.getweather(city: city);
      emit(Success());
    } on Exception catch (e) {
      emit(Failure());
    }
  }
}
