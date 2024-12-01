import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_app/presentation/drawer_view/widgets/dashboard_view.dart';
import 'package:team_app/presentation/home_screen/home_screen.dart';
import 'package:team_app/presentation/notification_screen/detail_notification_screen.dart';
import 'package:team_app/presentation/notification_screen/notification_screen.dart';
import 'package:team_app/presentation/splash_screen/splash_screen.dart';
import 'package:team_app/utility/constants/bloc_providers.dart';

import 'presentation/drawer_view/drawer_view.dart';

void main() {
  runApp(MultiBlocProvider(providers: blocProvider, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: DrawerViewScreen(),
    );
  }
}
