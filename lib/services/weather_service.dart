import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final dio = Dio();
  final String cityName;
  final String baseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = "305ee86b16bb46ed9a482743242207";
  WeatherService({required this.cityName});
  Future<WeatherModel> getWeatherInfo() async {
    try {
      var response = await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');

      WeatherModel weather = WeatherModel.fromJson(response.data);
      return weather;
    } on DioException catch (e) {
      
      final String errorMessage = e.response?.data['error']['message'] ??
          "oops there is an error ,try later";
          
      throw Exception(errorMessage);
    }  on Exception catch (  e) {
      log("${e.toString()}");
      throw Exception("oops an error try later");
    }
  }
}
