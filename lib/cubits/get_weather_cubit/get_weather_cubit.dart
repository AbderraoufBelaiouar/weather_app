import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(InitialState());
   WeatherModel? weatherModel;
  fetchWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService(cityName: cityName).getWeatherInfo();
      emit(
        WeatherLoadedState(weatherModel: weatherModel!),
      );
    } catch (e) {
      emit(WeatherFailureState(errMessage: e.toString()));
    }
  }
}
