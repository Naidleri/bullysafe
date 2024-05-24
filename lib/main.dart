import 'package:flutter/material.dart';
import 'package:flutter_application_bullysafe/views/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Basic Widget',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF6F6F6),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
