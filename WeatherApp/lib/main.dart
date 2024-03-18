
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/cubit/weather_app_cubit.dart';
import 'ui/cubit/weather_forecast_cubit.dart';
import 'ui/views/widgets/weather_app.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WeatherAppCubit()),
        BlocProvider(create: (context)=> WeatherForecastCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.blue, // AppBar'ın arka plan rengi
          ),
          primarySwatch: Colors.blue,
        ),
        home: WeatherApp(),
      ),
    );
  }
}
