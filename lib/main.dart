import 'package:flutter/material.dart';
import 'package:portfolio/screens/homepage/homescreen.dart';
import 'package:provider/provider.dart';

import 'controllers/homecontroller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeController>(
          create: (_) => HomeController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: _scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
      home: const HomeScreen(),
    );
  }
}
