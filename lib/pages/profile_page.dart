import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart' as fluIcon;
import 'package:flutter/rendering.dart';

import 'home_page.dart';
import 'profile_page.dart';

class ProfilePage extends StatefulWidget {
  final String title;
  final String userName;
  final ThemeData currentTheme;
  final Function(bool) onThemeChanged;

  const ProfilePage({super.key, required this.title, required this.userName, required this.currentTheme, required this.onThemeChanged,});

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  bool isChangedTheme(){
    return Theme.of(context).brightness == Brightness.dark
    ? true: false;
  }


  Widget setCupertino_DecoratedBox(Widget child){

    return DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,

          boxShadow: [
            BoxShadow(
              color: CupertinoColors.systemGrey.withOpacity(0.3),
              blurStyle: BlurStyle.normal,
              spreadRadius: 1.5,
              blurRadius: 2,
              offset: Offset(0, 2), // Sombra levemente para baixocolor: Colors.black,
            ),
          ],

          borderRadius: BorderRadius.circular(6),
      ),

      child: child,
    );


  }


  void showDialog_IncompletaFuncao() {
    showAdaptiveDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog.adaptive(
            //contentPadding: EdgeInsets.all(screenWidth*0.25),
            icon: Text(
              "INCOMPLETO...",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontFamily: "Arial",
              ),
            ),

            content: Text(
              "Implementar função!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: "Arial",
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final String title = super.widget.title;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),

      //  SafeArea, ao inves de Center, para garantir que o conteudo fique abaixo
      //  da notificação
      body: SafeArea(
          child: Column(children: [
        //SizedBox(height: 100,),

        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              // Container será a tela para infos, limitada pela barra
              // inferior travada no bottom.

              SizedBox(height: 60),

              Stack(
                children: [
                  CircleAvatar(
                    radius: screenWidth * 0.2,
                    backgroundColor: Color.fromRGBO(124, 156, 191, 10),
                    child: CircleAvatar(
                      radius: screenWidth * 0.185,
                      backgroundColor: Color.fromRGBO(212, 228, 247, 10),
                      foregroundColor: Color.fromRGBO(124, 156, 191, 10),
                      child: Text(
                        "data", //getUsernameIniciais(),
                        style: TextStyle(
                          fontSize: screenWidth * 0.085,
                          fontFamily: "Arial",
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: screenWidth * 0.07,
                      backgroundColor: Color.fromRGBO(124, 156, 191, 10),
                      child: IconButton(
                          hoverColor: Colors.lightBlueAccent.shade400,
                          padding: EdgeInsets.all(0),
                          iconSize: screenWidth * 0.075,
                          onPressed: () => showDialog_IncompletaFuncao(),
                          icon: Icon(
                            Icons.photo_camera_outlined,
                            color: Colors.white,
                          )),
                    ),
                  )
                ],
              ),

              SizedBox(
                height: 50,
              ),

              Text(
                "Username",
                style: TextStyle(
                  fontSize: 23,
                  fontFamily: "Lucida",
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(
                height: 15,
              ),

              Text(
                textAlign: TextAlign.center,
                "@id_name", //idName
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Lucida",
                    color: Colors.grey.shade700),
              ),

              SizedBox(
                height: 10,
              ),

              Text(
                textAlign: TextAlign.center,
                "example@email.com", //email,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Lucida",
                    color: Colors.grey.shade700),
              ),

              SizedBox(
                height: 30,
              ),

              SizedBox(
                width: screenWidth * 0.8,
                height: screenHeight * 0.06,
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Color.fromRGBO(124, 156, 191, 10),
                      overlayColor: Colors.lightBlue.shade400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                  onPressed: () {
                    showDialog_IncompletaFuncao();
                  },
                  child: Stack(

                    children: [
                      Positioned(
                        right: screenWidth * 0.5, left: 0,
                        top: 0, bottom: 0,

                        child: Icon(
                          fluIcon.FluentIcons.pen_48_regular,
                          color: Colors.white,
                          size: screenHeight*0.0255,
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Editar Perfil",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white, fontFamily: "Lucida",
                                fontSize: screenHeight*0.0195
                            ),

                          )
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30),

              SizedBox(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.115,

                  //  Função dinamica para criar uma DecoratedBox no tema
                  //  Cupertino, dinamica a qualquer Widget
                  child: setCupertino_DecoratedBox(
                    Stack(
                      children: [

                        Positioned(
                          left: screenWidth*0.05,
                          bottom: 0, top: 0,

                          child: Icon(
                            fluIcon.FluentIcons.weather_sunny_32_regular,
                            size: screenHeight*0.0275,
                            color: Colors.grey,
                          )
                        ),

                        Positioned(
                            top: screenHeight*0.0295,
                            left: screenWidth*0.175,

                            child: Column(
                              children: [
                                Text(
                                  "Tema Escuro",
                                  style: TextStyle(
                                      fontSize: screenHeight*0.0195,
                                      fontFamily: "Arial"
                                  ),
                                ),

                                SizedBox(height: screenHeight*0.005,),
                                Text(
                                  isChangedTheme()
                                  ?  "Ativado" : "Desativado",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: screenHeight*0.018,
                                      fontFamily: "Arial",
                                      color: Colors.grey,
                                  )
                                ),
                              ],
                            ),
                        ),

                        Positioned(
                          right: screenWidth*0.05,
                          top: 0, bottom: 0,

                            child: Switch.adaptive(
                              value: isChangedTheme(),

                              activeTrackColor: Color.fromRGBO(124, 156, 191, 10),
                              //applyCupertinoTheme: true,

                              onChanged: (bool value) {
                                widget.onThemeChanged(value);
                                setState(() {});

                              }




                            )

                        )

                      ],
                    ),

                  ),




                )

              ],
            ),
          )
        ),

        Container(
          child: SizedBox(
              //height: 60,

              child: ColoredBox(
            color: Colors.blueGrey.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  padding: EdgeInsets.all(4),
                  icon: Icon(
                    fluIcon.FluentIcons.home_32_regular,
                    color: Color.fromRGBO(124, 156, 191, 1),
                  ),
                  onPressed: () {
                    //    Navega, incluindo a animação, somente se estiver
                    //  fora da tela que irá navegar.
                    if (context.widget is! HomePage) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(
                                    title: title,
                                    currentTheme: widget.currentTheme,
                                    onThemeChanged: widget.onThemeChanged,
                                  )));
                    }
                  },
                ),
                Icon(fluIcon.FluentIcons.book_32_regular,
                    color: Color.fromRGBO(124, 156, 191, 1)),
                Icon(fluIcon.FluentIcons.apps_32_regular,
                    color: Color.fromRGBO(124, 156, 191, 1)),
                Icon(fluIcon.FluentIcons.chat_32_regular,
                    color: Color.fromRGBO(124, 156, 191, 1)),

                IconButton(
                  //padding: EdgeInsets.all(4),
                  icon: Icon(fluIcon.FluentIcons.person_32_regular,
                      color: Color.fromRGBO(124, 156, 191, 1)),
                  onPressed: () {
                    if (context.widget is! ProfilePage) {
                      Navigator.push(
                          context,

                          MaterialPageRoute(
                              builder: (context) => ProfilePage(
                                    title: "Configurações de Perfil.",
                                    userName: '',
                                    currentTheme: widget.currentTheme,
                                    onThemeChanged: (bool value ) {
                                      setState(() {
                                        widget.onThemeChanged(value);
                                      });
                                    },
                                  )
                          )
                      );
                    }
                  },
                )
              ],
            ),
          )),
        ),
      ])),
    );
  }
}
