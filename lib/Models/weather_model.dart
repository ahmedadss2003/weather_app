class WeatherModel {
  final String cityName;
  final String date;
  final String image;
  final double maxTemp;
  final double minTemp;
  final double avgTemp;
  final String weatherCondition;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.image,
      required this.maxTemp,
      required this.minTemp,
      required this.avgTemp,
      required this.weatherCondition});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json["location"]["name"],
      date: json["current"]["last_updated"],
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      maxTemp: json["forecast"]["forecastday"][0]['day']["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]['day']["mintemp_c"],
      avgTemp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      weatherCondition: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
    );
  }
}
