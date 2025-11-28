import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart' as fluIcon;
import 'package:neuro_uff/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'pages/home_page.dart';

class LoginPage extends StatefulWidget{

  const LoginPage({super.key, required this.title,
    required this.currentTheme,
    required this.onThemeChanged
  });
  
  final String title;
  final ThemeData currentTheme;
  final Function(bool) onThemeChanged;
  
  @override
  State<StatefulWidget> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage>{

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth  = MediaQuery.of(context).size.width;
    final String title = super.widget.title;

    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent.shade200,

        title: Text(title),
        titleTextStyle: TextStyle(
          fontFamily: 'Calibri',
          //fontStyle: FontStyle.italic,
          fontSize: 20
        ),


      ),

      body: Stack(

        children: [

          Align(
            alignment: Alignment(0,-1),

            child: Image.asset('lib/assets/images/neuroUff_logo.png'),




            ),

            Align(
              alignment: Alignment.bottomCenter,

              child:Container(
                alignment: Alignment.bottomCenter,

                  child: Align(
                    alignment: Alignment(0,0.3),

                    child: SizedBox(
                      width: screenWidth/1.05,

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
                              )

                          ),
                       ),
                    )
                  )
              )
            ),

          Align(
              alignment: Alignment.bottomCenter,

              child:Container(
                  alignment: Alignment.bottomCenter,

                  child: Align(
                      alignment: Alignment(0,0.49),

                      child: SizedBox(
                        width: screenWidth/1.05,

                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Senha",
                              labelStyle: TextStyle(
                                  fontFamily: "calibri",
                                  fontSize: 20
                              ),

                              prefixIcon: Icon(
                                Icons.lock,
                              )

                          ),
                        ),
                      )
                  )
              )
          ),

          Align(
            alignment: Alignment(0,0.7),
            
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.lightBlueAccent.shade100),
                overlayColor: WidgetStatePropertyAll(Colors.blueAccent.shade400),
                foregroundColor: WidgetStatePropertyAll(Colors.deepPurpleAccent.shade400),
              ),

              child: SizedBox(
                width: screenWidth/2,
                height: screenWidth/18.7,

                child: Text(
                  "Login",
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 16.4,
                    fontFamily: 'Times News Roman',
                    fontWeight: FontWeight.bold,

                    //backgroundColor: Colors.lightBlueAccent.shade100,
                  ),
                ),
              ),

              onPressed: () {
                Navigator.push( context,
                  MaterialPageRoute(
                      builder: (context) =>
                      HomePage(title: 'Início',)
                  )
                );
              },


            ),

          ),

          Align(
            alignment: Alignment(0, 0.84),

            child: TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.lightBlueAccent.shade100),
                overlayColor: WidgetStatePropertyAll(Colors.blueAccent.shade400),
                foregroundColor: WidgetStatePropertyAll(Colors.deepPurpleAccent.shade400),
                //padding: WidgetStateProperty<EdgeInsetsGeometry>.new

              ),

              child: SizedBox(
                width: screenWidth/2,
                height: screenWidth/16,

                child: Text(
                  """
               Entrar SEM LOGIN
                 """,
                  textAlign: TextAlign.start,

                  style: TextStyle(
                    fontSize: 16.4,
                    fontFamily: 'Times News Roman',
                    fontWeight: FontWeight.bold,

                    //backgroundColor: Colors.lightBlueAccent.shade100,
                  ),
                ),
              ),

              onPressed: () {
                Navigator.push( context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomePage(title: 'Início',)
                    )
                );
              },


            ),


          )




        ],



      ),








    );


  }






}