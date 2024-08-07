import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Search a city'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onSubmitted: (value) async {
              var getWeather = BlocProvider.of<GetWeatherCubit>(context);
              getWeather.fetchWeather(cityName: value);
              Navigator.of(context).pop();
            },
            decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                hintText: 'Enter City Name',
                labelText: 'Search'),
          ),
        ),
      ),
    );
  }
}

WeatherModel? weatherModel;
