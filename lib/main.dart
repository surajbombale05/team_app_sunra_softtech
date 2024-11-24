import 'package:flutter/material.dart';
import 'package:team_app/presentation/home_screen/home_screen.dart';
import 'package:team_app/presentation/notification_screen/detail_notification_screen.dart';
import 'package:team_app/presentation/notification_screen/notification_screen.dart';
import 'package:team_app/presentation/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}
