

class WeatherModel {
  final String cityName;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherStatus;
  final DateTime lastUpdate;
  WeatherModel(
      {required this.lastUpdate,
      this.image,
      required this.cityName,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStatus});
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      image: json['current']['condition']['icon'],
      cityName: json['location']['name'],
      temp: json['current']['temp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherStatus: json['current']['condition']['text'],
      lastUpdate:DateTime.parse( json['current']['last_updated']),
    );
  }
}
