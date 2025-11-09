import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(); // Load .env variables
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Read environment variable
    final apiUrl = dotenv.env['API_URL'] ?? 'https://fallback.com';

    return MaterialApp(
      title: 'Flutter Web Render',
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Web on Render')),
        body: Center(
          child: Text('API URL: $apiUrl'),
        ),
      ),
    );
  }
}
