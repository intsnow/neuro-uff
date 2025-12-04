import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart' as fluIcon;
import 'package:neuro_uff/assets/constants/colors_scheme.dart';
import 'package:neuro_uff/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage(
      {super.key,
      required this.title,
      required this.currentTheme,
      required this.onThemeChanged});

  final String title;
  final ThemeData currentTheme;
  final Function(bool) onThemeChanged;

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final String title = super.widget.title;

    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // Travando tamanho da imagem com 'height' e distorção em 'fit'
              height: screenHeight * 0.25,

              child: Image.asset(
                'lib/assets/images/neuroUff_logo.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: screenWidth / 1.05,
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    labelStyle: TextStyle(
                      fontFamily: "Calibri",
                      fontSize: 19,
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                    )),
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              width: screenWidth / 1.05,
              child: TextFormField(
                obscureText: isObscure,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Senha",
                    labelStyle: TextStyle(fontFamily: "calibri", fontSize: 20),
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(isObscure
                          ? fluIcon.FluentIcons.eye_off_32_regular
                          : fluIcon.FluentIcons.eye_32_regular),
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                    )),
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
                width: screenWidth / 1.08,
                height: screenHeight / 12,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        ColorsScheme.neuroBlue, //Colors.blueAccent.shade700,
                    overlayColor:
                        ColorsScheme.neuroBlue, //Colors.blueAccent.shade400,
                    foregroundColor: Colors.white,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),

                    //padding: EdgeInsets.all(screenWidth/100)
                  ),
                  child: Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.4,
                      fontFamily: 'Arial',
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(
                                  title: 'Início',
                                  currentTheme: widget.currentTheme,
                                  onThemeChanged: widget.onThemeChanged,
                                )));
                  },
                )),
            SizedBox(height: 8),
            SizedBox(
              width: screenWidth / 1.08,
              height: screenHeight / 12,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor:
                      ColorsScheme.neuroBlue, //Colors.blueAccent.shade400,
                  overlayColor:
                      ColorsScheme.neuroBlueLight, //Colors.blueAccent.shade400,
                  foregroundColor: ColorsScheme.foregroundLight,

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                child: Text(
                  "Entrar SEM LOGIN",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.4,
                    fontFamily: 'Arial',
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                                title: 'Início',
                                currentTheme: widget.currentTheme,
                                onThemeChanged: widget.onThemeChanged,
                              )));
                },
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    ));
  }
}
