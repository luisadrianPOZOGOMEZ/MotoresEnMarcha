import 'package:flutter/material.dart';
import 'package:motoresenmarcha/pages/cursos_pages.dart';
import 'package:motoresenmarcha/pages/home_pages.dart';
import 'package:motoresenmarcha/pages/juegos_pages.dart';
import 'package:motoresenmarcha/pages/login_pages.dart'; 
import 'package:motoresenmarcha/pages/logros_pages.dart'; 
import 'package:motoresenmarcha/pages/register_pages.dart';
import 'package:motoresenmarcha/pages/perfil_pages.dart'; 
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 81, 229, 255)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => RegisterPage(),
        '/juegos': (context) => const JuegosPage(),
        '/logros': (context) => const LogrosPage(),
        '/cursos': (context) => const CursosPage(),
        '/perfil': (context) => PerfilPage(),
      },
    );
  }
}
