import 'package:coffe_app/home_screen.dart';
import 'package:coffe_app/util/app_route.dart';
import 'package:flutter/material.dart';

import 'details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.white),
      ),
    routes: {
        AppRoute.homeViewNameRoute :(context)=>HomeScreen(),
        AppRoute.detailsScreenNameRoute :(context)=>DetailsScreen(),
    },
    initialRoute: AppRoute.homeViewNameRoute,
    );
  }
}


