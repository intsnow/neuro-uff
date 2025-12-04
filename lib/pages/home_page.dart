import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart' as fluIcon;
import 'package:flutter/rendering.dart';
import 'package:neuro_uff/pages/login_page.dart';
import 'package:neuro_uff/pages/profile_page.dart';

import '../assets/constants/colors_scheme.dart';

class HomePage extends StatefulWidget {

  final String title;
  final ThemeData currentTheme;
  final Function(bool) onThemeChanged;

  const HomePage(
      {super.key,
      required this.title,
      required this.currentTheme,
      required this.onThemeChanged});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final String title = super.widget.title;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
            title: Align(
                alignment: Alignment.center,

                child: IconButton(
                  icon: Text(
                    "Ir pra LOGIN",
                    style: TextStyle(
                      fontSize: screenHeight * 0.015,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPage(
                                title: title,
                                currentTheme: widget.currentTheme,
                                onThemeChanged: widget.onThemeChanged)));
                  },
                ))),

        body: Center(
            child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,

              children: [

                  Flexible(
                    fit: FlexFit.loose,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,

                        children: [
                          Icon(
                            fluIcon.FluentIcons.home_32_regular,
                            color: ColorsScheme.neuroBlue,
                            size: 55,
                          ),

                          const SizedBox(height: 24),
                          const Text(
                            'Início',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Calibri',
                            ),
                          ),

                          const SizedBox(height: 4),
                          Text(
                            'Bem-vindo ao seu aplicativo.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Calibri',
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Colors.grey.shade400
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

              ],
            ),
          ),
        )),

        bottomNavigationBar: DecoratedBox(
              decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? ColorsScheme.navBarBackgroundDark
                      : ColorsScheme.navBarBackgroundLight,
                  boxShadow: [
                    BoxShadow(
                        color: ColorsScheme.foregroundDark.withOpacity(0.5),
                        blurRadius: 4,
                        offset: Offset(0, 2)
                    )
                  ]),


              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    IconButton(
                      hoverColor: Colors.transparent,
                      icon: Icon(fluIcon.FluentIcons.home_32_filled,
                          color: ColorsScheme.neuroBlue,
                          size: screenHeight * 0.035

                      ),
                      onPressed: () {}, // Já está na home
                    ),

                    Icon(fluIcon.FluentIcons.book_32_regular,
                        color: ColorsScheme.neuroBlue,
                        size: screenHeight * 0.035),
                    Icon(fluIcon.FluentIcons.apps_32_regular,
                        color: ColorsScheme.neuroBlue,
                        size: screenHeight * 0.035),
                    Icon(fluIcon.FluentIcons.chat_32_regular,
                        color: ColorsScheme.neuroBlue,
                        size: screenHeight * 0.035),

                    IconButton(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,

                      icon: Icon(fluIcon.FluentIcons.person_32_regular,
                          color: ColorsScheme.neuroBlue,
                          size: screenHeight * 0.035),

                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage(
                                    title: "Configurações",
                                    userName: "",
                                    currentTheme: widget.currentTheme,
                                    onThemeChanged:
                                    widget.onThemeChanged)));
                      },
                    ),
                  ],
                ),
              ),
            )

    );
  }
}
