// this is mange state ui based on created states
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/Services/weater_services.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(NoWeatherInitialState());
  // late keyword tell WeatherModel u will take data but wait 
   WeatherModel? weatherModel ;
  getWeather({required cityName}) async {
    try {
       weatherModel =
          await WeatherServices(Dio()).getCurrentWeather(cityName);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
