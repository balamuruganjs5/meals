import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/screens/tab_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
        // brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(255, 131, 57, 0),
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: const TabScreen(),
    );
  }
}
