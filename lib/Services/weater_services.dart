import 'package:dio/dio.dart';
import 'package:weather_app/Models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = "1901e65ef59c4d42841171926242003";
  WeatherServices(this.dio);

  Future<WeatherModel> getCurrentWeather(String cityName) async {
    try {
      // dio package already handling the response returned from status code
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");

      //response =? is a object contain all the response data to access data use (jsonData.data)
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      // note (e) is contain the bad response =>error message
      String errorMessage = e.response?.data["error"]["message"] ??
          "Oops There Was an Error, Try Later";
      throw Exception(errorMessage);
      // (?)this mean the return data data can be null & (??) to check if data already null throw this message
    } catch (e) {
      throw Exception("Unexpected error: ${e.toString()}");
    }
  }
}
