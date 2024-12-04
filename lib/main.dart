import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'forecast_screen.dart';
import 'settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.black),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.normal, color: Colors.white),
          bodyLarge: TextStyle(fontSize: 14.0, color: Colors.black),

        ),
      ),
      home: const HomeScreen(),
      routes: {
        '/forecast': (context) => const ForecastScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
