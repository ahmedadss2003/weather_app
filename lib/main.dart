import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      // (important Note)
      // here are create GetWeatherCubit and if U need use it must context of use after GetWeatherCubit
      //So We use Builder Widget Because it's context (after بعد) GetWeatherCubit
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? weatherCondition) {
  if (weatherCondition == null) {
    return Colors.blue;
  }
  switch (weatherCondition) {
    case "Sunny":
    case "Clear":
      return Colors.amber;
    case "Partly cloudy":
    case "Cloudy":
    case "Overcast":
      return Colors.grey;
    case "Mist":
    case "Fog":
    case "Freezing fog":
      return Colors.blueGrey;
    case "Patchy rain possible":
    case "Light drizzle":
    case "Patchy light drizzle":
    case "Light rain":
    case "Patchy light rain":
    case "Light rain shower":
    case "Patchy light rain with thunder":
      return Colors.lightBlue;
    case "Moderate rain at times":
    case "Moderate rain":
    case "Moderate or heavy rain shower":
    case "Moderate or heavy rain with thunder":
      return Colors.blue;
    case "Heavy rain at times":
    case "Heavy rain":
    case "Torrential rain shower":
      return Colors.indigo;
    case "Patchy snow possible":
    case "Patchy light snow":
    case "Light snow":
    case "Light snow showers":
    case "Patchy light snow with thunder":
      return Colors.lightBlue;
    case "Moderate snow":
    case "Patchy moderate snow":
    case "Moderate or heavy snow showers":
    case "Moderate or heavy snow with thunder":
      return Colors.blue;
    case "Heavy snow":
    case "Patchy heavy snow":
    case "Blowing snow":
    case "Blizzard":
      return Colors.cyan;
    case "Patchy sleet possible":
    case "Light sleet":
    case "Light sleet showers":
    case "Moderate or heavy sleet showers":
      return Colors.blueGrey;
    case "Patchy freezing drizzle possible":
    case "Light freezing rain":
    case "Freezing drizzle":
    case "Moderate or heavy freezing rain":
      return Colors.teal;
    case "Thundery outbreaks possible":
      return Colors.deepPurple;
    case "Ice pellets":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.teal;
    default:
      return Colors.grey; // Default color for unspecified weather conditions
  }
}

// important Note
// primarySwatch: Colors.blue => this call material Color Because contain collection of color
// primarySwatch: Color(0xff1010) => but this call primary color
// U can't pass primary color to material color but the opposite can
