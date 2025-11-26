
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart' as fluIcon;
import 'package:relative_scale/relative_scale.dart' as relScale;

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {

    // Funções auxiliares para porcentagem

    return relScale.RelativeBuilder(

      builder: (context, height, width, sy, sx) {

        double sy_percent(double percent) => sy(height * (percent / 100));
        double sx_percent(double percent) => sx(width * (percent / 100));

        return Scaffold(

            backgroundColor: Color.fromRGBO(250, 250, 250, 11),

            body: Center(

                //widthFactor: sx_percent(100),
                child: Column(

                    mainAxisAlignment: MainAxisAlignment.end,

                    children: <Widget>[

                      Container(

                        height: sy(120),
                        width: sx_percent(50),

                        child: Icon(
                          fluIcon.FluentIcons.home_32_regular,
                          color: Color.fromRGBO(124, 156, 191, 11),
                          size: 55,
                        ),
                      ),

                      Container(

                          height: sy(16),
                          width: sx_percent(50),

                          child: Text(
                            'Início',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Calibri'
                            ),
                          )
                      ),

                      Container(

                        height: sy(200),
                        margin: EdgeInsets.only(bottom:5),

                        child: Text(
                          'Bem-vindo ao seu aplicativo.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Calibri',
                              color: Color.fromRGBO(0, 0, 0, 76)
                          ),
                        ),
                      ),

                      Container(
                        height: sy(41),
                        //width: sx_percent(50),//sx(302),
                        color: Colors.white70,
                        padding: EdgeInsets.only(right: sx_percent(50)),

                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.center,


                          children: [
                            Container(

                              //margin: EdgeInsets.only(right:  sx(30)),

                              child: Icon(

                                fluIcon.FluentIcons.home_32_regular,
                                color: Color.fromRGBO(124, 156, 191, 11),
                                size: 30,
                              ),
                            ),

                            Container(

                              //margin: EdgeInsets.only(right:  sx(30)),

                              child: Icon(
                                fluIcon.FluentIcons.book_32_regular,
                                color: Color.fromRGBO(124, 156, 191, 11),
                                size: 30,
                              ),
                            ),


                            Container(

                              //margin: EdgeInsets.only(right:  sx(30)),

                              child: Icon(
                                fluIcon.FluentIcons.apps_32_regular,
                                color: Color.fromRGBO(124, 156, 191, 11),
                                size: 30,
                              ),
                            ),

                            Container(

                              //margin: EdgeInsets.only(right:  sx(30)),

                              child: Icon(
                                fluIcon.FluentIcons.chat_32_regular,
                                color: Color.fromRGBO(124, 156, 191, 11),
                                size: 30,
                              ),
                            ),

                            Container(

                              margin: EdgeInsets.only(right:  sx(30)),

                              child: Icon(
                                fluIcon.FluentIcons.person_32_regular,
                                color: Color.fromRGBO(124, 156, 191, 11),
                                size: 30,
                              ),
                            ),



                          ],
                        ),
                      )

                    ]
                )

            )

        );
      }
    );

  }
}
