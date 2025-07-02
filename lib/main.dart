import 'package:flutter/material.dart';
import 'package:devrede_portfolio/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevRede',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.light,
        fontFamily: 'Montserrat',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Montserrat',
      ),
      themeMode: ThemeMode.system, // Alterna conforme o sistema do usuário
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
