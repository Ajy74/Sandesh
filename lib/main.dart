import 'package:flutter/material.dart';
import 'package:sandesh/screens/home_screen.dart';
import 'package:sandesh/utils/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sandesh',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSwatch(accentColor: Color(0xFF128C7E),),
        // useMaterial3: true,
        fontFamily: "OpenSans",
        primaryColor: const Color(0xFF075E54),
        appBarTheme: const AppBarTheme(
          backgroundColor: primary,
          foregroundColor: Colors.white
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

