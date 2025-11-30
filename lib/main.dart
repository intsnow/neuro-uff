import 'package:flutter/material.dart';
import 'package:neuro_uff/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'assets/constants/colors_scheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp>{

  ThemeMode _themeMode = ThemeMode.light;

  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    setState(() {
      _themeMode = isDarkTheme ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void _changeTheme(bool isDarkTheme) async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _themeMode = isDarkTheme ? ThemeMode.dark : ThemeMode.light;
      prefs.setBool('isDarkTheme', isDarkTheme); // Salvando na memoria
    });
  }

  static final ThemeData _lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorsScheme.backgroundLight,
    primaryColor: ColorsScheme.neuroBlue,

    // Esquema de cores moderno
    colorScheme: ColorScheme.light(
      primary: ColorsScheme.neuroBlue,
      surface: Colors.white,
      onSurface: ColorsScheme.textLight,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsScheme.neuroBlueLight, // Usei o azul claro aqui
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: 'Arial',
          fontWeight: FontWeight.bold
      ),
    ),
    fontFamily: 'Arial',
  );

  static final ThemeData _darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorsScheme.backgroundDark,
    primaryColor: ColorsScheme.neuroBlue,

    colorScheme: ColorScheme.dark(
      primary: ColorsScheme.neuroBlue,
      surface: Colors.grey.shade900,
      onSurface: ColorsScheme.textDark,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E), // Um cinza escuro para a barra
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'Arial',
          fontWeight: FontWeight.bold
      ),
    ),
    fontFamily: 'Arial',
  );



  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
        title: 'NeuroUFF',
        debugShowCheckedModeBanner: false, //tira faixa de Debug

        theme: _lightTheme,     // Tema Light personalizado
        darkTheme: _darkTheme,  // Tema Dark personalizado
        themeMode: _themeMode,  // Tema no estado atual (dark ou light)

        home: LoginPage(
            title: 'Login',
            currentTheme: _themeMode == ThemeMode.dark ? _darkTheme : _lightTheme,
            onThemeChanged: _changeTheme,

        )

    );
  }

}



