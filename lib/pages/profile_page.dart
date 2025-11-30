import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart' as fluIcon;
import 'package:flutter/rendering.dart';

import 'home_page.dart';
import 'profile_page.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({super.key, required this.title, required this.username});

  final String title;
  final String username;

  @override
  State<StatefulWidget> createState() =>  _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage>{

  void showDialog_IncompletaFuncao() {
    showAdaptiveDialog(
        context: context,
        builder: (BuildContext context){

          return
            AlertDialog.adaptive(
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
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: "Arial",
                ),
                textAlign: TextAlign.justify,
              ),

            );
        }
    );
  }

  @override
  Widget build(BuildContext context){

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth  = MediaQuery.of(context).size.width;
    final String title = super.widget.title;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),

      body: Center(

        child: Column(
        children: [

          Stack(
             //mainAxisAlignment: MainAxisAlignment.center,

             children: [

               SizedBox(height: 100,),

               Center(

                 child: SingleChildScrollView(
                   child: Column(

                     children: [

                       // Container será a tela para infos, limitada pela barra
                       // inferior travada no bottom.
                       Container(
                         height: screenHeight,

                         child: Column(
                           children: [

                             SizedBox(height: 100),

                             Stack(
                               children: [

                                 CircleAvatar(
                                   radius: screenWidth*0.25,
                                   backgroundColor: Color.fromRGBO(124, 156, 191, 10),

                                   child: CircleAvatar(
                                     radius: screenWidth*0.235,
                                     backgroundColor: Color.fromRGBO(212, 228, 247, 10),
                                     foregroundColor: Color.fromRGBO(124, 156, 191, 10),

                                     child: Text(
                                       "data",//getUsernameIniciais(),
                                       style: TextStyle(
                                         fontSize: 28,
                                         fontFamily: "Arial",
                                       ),
                                     ),

                                   ),
                                 ),

                                 Positioned(
                                   bottom: 0, right: 0,

                                   child: Container(
                                     height: screenWidth*0.15,

                                     child: CircleAvatar(
                                       radius: screenWidth*0.1,
                                       backgroundColor: Color.fromRGBO(124, 156, 191, 10),

                                       child: IconButton(
                                           onPressed: () => showDialog_IncompletaFuncao(),

                                           icon: Icon(
                                             Icons.photo_camera_outlined,
                                             color: Colors.white,
                                           )
                                       ),
                                     ),
                                   )

                                 )






                               ],

                             ),




                          ],

                         )

                       ),

                     ],

                   ),
                 )

               ),

               Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,

                  child: SizedBox(
                    //height: 60,


                      child:  ColoredBox(
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
                                if (context.widget is! HomePage ) {
                                  Navigator.push(
                                      context, MaterialPageRoute(
                                      builder: (context) => HomePage(title: title,)
                                  )
                                  );
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
                              icon:  Icon(
                                  fluIcon.FluentIcons.person_32_regular,
                                  color: Color.fromRGBO(124, 156, 191, 1)
                              ),

                              onPressed: () {
                                if (context.widget is! ProfilePage){
                                  Navigator.push(
                                      context, MaterialPageRoute(
                                      builder: (context) => ProfilePage(title: "Configurações de Perfil.", username: '',)
                                  )
                                  );
                                }
                              },
                            )
                          ],
                        ),
                      )

                  ),
                ),



             ]
           )


        ]
      )


      ),


    );


  }



}