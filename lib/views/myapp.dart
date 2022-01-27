import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ringier_test_task/views/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // setting portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IT book SE',
      home: HomeScreen(),
    );
  }
}
