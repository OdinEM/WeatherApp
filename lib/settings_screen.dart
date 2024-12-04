import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);


  @override
  SettingsScreenState createState() => SettingsScreenState(); // Ensure this class is public
}

class SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(labelText: 'Enter city name'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the city name and navigate back
                Navigator.pop(context, _cityController.text);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
