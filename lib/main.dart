import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(primarySwatch:getThemeColor (BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherStatus)),
                home: const HomeView(),
              );
            },
          );
        },
      ),
    );
  }
}

MaterialColor getThemeColor(String? weatherStatus) {
  if (weatherStatus == null) {
    return Colors.blue;
  } else {
    switch (weatherStatus) {
      case "Sunny":
        return Colors.brown;
      case "Partly cloudy":
        return Colors.blueGrey;
      case "Cloudy":
        return Colors.grey;
      case "Overcast":
        return Colors.grey;
      case "Mist":
        return Colors.blueGrey;
      case "Patchy rain possible":
        return Colors.lightBlue;
      case "Patchy snow possible":
        return Colors.blueGrey;
      case "Patchy sleet possible":
        return Colors.blueGrey;
      case "Patchy freezing drizzle possible":
        return Colors.blueGrey;
      case "Thundery outbreaks possible":
        return Colors.deepPurple;
      case "Blowing snow":
        return Colors.blue;
      case "Blizzard":
        return Colors.grey;
      case "Fog":
        return Colors.grey;
      case "Freezing fog":
        return Colors.blueGrey;
      case "Patchy light drizzle":
        return Colors.lightBlue;
      case "Light drizzle":
        return Colors.lightBlue;
      case "Freezing drizzle":
        return Colors.cyan;
      case "Heavy freezing drizzle":
        return Colors.cyan;
      case "Patchy light rain":
        return Colors.lightBlue;
      case "Light rain":
        return Colors.lightBlue;
      case "Moderate rain at times":
        return Colors.blue;
      case "Moderate rain":
        return Colors.blue;
      case "Heavy rain at times":
        return Colors.indigo;
      case "Heavy rain":
        return Colors.indigo;
      case "Light freezing rain":
        return Colors.cyan;
      case "Moderate or heavy freezing rain":
        return Colors.cyan;
      case "Light sleet":
        return Colors.blueGrey;
      case "Moderate or heavy sleet":
        return Colors.blueGrey;
      case "Patchy light snow":
        return Colors.lightBlue;
      case "Light snow":
        return Colors.lightBlue;
      case "Patchy moderate snow":
        return Colors.blue;
      case "Moderate snow":
        return Colors.blue;
      case "Patchy heavy snow":
        return Colors.indigo;
      case "Heavy snow":
        return Colors.indigo;
      case "Ice pellets":
        return Colors.cyan;
      case "Light rain shower":
        return Colors.lightBlue;
      case "Moderate or heavy rain shower":
        return Colors.blue;
      case "Torrential rain shower":
        return Colors.indigo;
      case "Light sleet showers":
        return Colors.blueGrey;
      case "Moderate or heavy sleet showers":
        return Colors.blueGrey;
      case "Light snow showers":
        return Colors.lightBlue;
      case "Moderate or heavy snow showers":
        return Colors.blue;
      case "Light showers of ice pellets":
        return Colors.cyan;
      case "Moderate or heavy showers of ice pellets":
        return Colors.cyan;
      case "Patchy light rain with thunder":
        return Colors.deepPurple;
      case "Moderate or heavy rain with thunder":
        return Colors.deepPurple;
      case "Patchy light snow with thunder":
        return Colors.lightBlue;
      case "Moderate or heavy snow with thunder":
        return Colors.blue;
      default:
        return Colors.blue;
    }
  }
}
