import 'package:flutter/material.dart';
import 'api_service.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({Key? key}) : super(key: key);

  @override
  _ForecastScreenState createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  final String apiKey = '3f08c8cfd3eccf84733b76947857e125'; // Your API key
  final String city = 'Kigali'; // Replace with your desired city

  late Future<Map<String, dynamic>> _forecastData;

  @override
  void initState() {
    super.initState();
    _forecastData = fetchForecast(city, apiKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('5-Day Forecast'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _forecastData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final forecast = snapshot.data;
            return ListView.builder(
              itemCount: forecast!['list'].length,
              itemBuilder: (context, index) {
                final dayForecast = forecast['list'][index];
                final date = DateTime.parse(dayForecast['dt_txt']);
                final temp = (dayForecast['main']['temp'] - 273.15).toStringAsFixed(2);
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: Text(
                      'Date: $date',
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(
                      'Temperature: $temp°C',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
