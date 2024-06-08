import 'package:flutter/material.dart';
import 'package:flutter_application_bullysafe/views/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
