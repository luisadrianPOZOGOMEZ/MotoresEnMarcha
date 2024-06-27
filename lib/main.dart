import 'package:flutter/material.dart';
import 'package:motoresenmarcha/pages/cursos_pages.dart';
import 'package:motoresenmarcha/pages/home_pages.dart';
import 'package:motoresenmarcha/pages/juegos_pages.dart';
import 'package:motoresenmarcha/pages/login_pages.dart'; 
import 'package:motoresenmarcha/pages/logros_pages.dart'; 
import 'package:motoresenmarcha/pages/register_pages.dart';


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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 81, 229, 255)),
        useMaterial3: true,
      ),
      //home: const MyHomePage(),
      initialRoute: '/',
      routes: {
        '/':(context) => const MyHomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/juegos': (context) => const JuegosPage(),
        '/logros': (context) => const LogrosPage(),
        '/cursos': (context) => const CursosPage(),
      },
    );
  }
}