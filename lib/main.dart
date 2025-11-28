import 'package:flutter/material.dart';
import 'package:neuro_uff/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp>{

  ThemeData _currentTheme = _lightTheme;

  // This widget is the root of your application.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadTheme();
  }

  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    setState(() {
      _currentTheme = isDarkTheme ? _darkTheme : _lightTheme;
    });
  }

  void _changeTheme(bool isDarkTheme) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentTheme = isDarkTheme ? _darkTheme : _lightTheme;
      prefs.setBool('isDarkTheme', isDarkTheme);
    });
  }

  static final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFFF5F5F5), // Branco meio acinzentado
      elevation: 2, // Adiciona uma linha na parte inferior
      shadowColor: Colors.grey, // Cor da linha
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
    ),
  );

  static final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF6200EA), // Roxo para combinar com tema escuro
      elevation: 2, // Adiciona uma linha na parte inferior
      shadowColor: Colors.black, // Cor da linha
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );



  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
        title: 'NeuroUFF',
        theme: _currentTheme,

        home: LoginPage(
            title: 'Tela Login',
            currentTheme: _currentTheme,
            onThemeChanged: _changeTheme,

        )

    );
  }

}



