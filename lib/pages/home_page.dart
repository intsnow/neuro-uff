
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart' as fluIcon;
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth  = MediaQuery.of(context).size.width;
    final String title = super.widget.title;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),

      body: Stack(
        children: [

          // -----------------------------------------------------------
          // 1. CONTEÚDO CENTRAL SUPERIOR:  Icone 'home' + os dois textos
          // -----------------------------------------------------------
          Align(
            alignment: Alignment.topCenter,

            child: Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.4),

              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [
                  Icon(
                    fluIcon.FluentIcons.home_32_regular,
                    color: const Color.fromRGBO(124, 156, 191, 1),
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

                  const SizedBox(height:4),

                  const Text(
                    'Bem-vindo ao seu aplicativo.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Calibri',
                      color: Color.fromRGBO(0, 0, 0, 0.76),
                    ),
                  ),

                ],
              ),

            ),
          ),

          // -----------------------------------------------------------
          // 2. BARRA INFERIOR FIXA EM 50% DA TELA
          // -----------------------------------------------------------
          Positioned(
            //  'Positioned()' força a barra estar fixa e proporcional, mesmo
            //  com ajuste de tela. Sem o bottom posto, a barra estaria no meio
            //  da tela, na parte superior.
            bottom: 0,

            //   Left e Right mantêm o espaçamento das extremidades fixo (no
            //   caso, em zero, para o 1° e o ultimo Icon estarem fixados sempre
            //   na ponta).

            //   Junto ao "MainAxisAlignment.spaceEvenly", que força um espaço
            //  entre cada Icon na children, a barra inferior se manterá em 50%
            //  da tela.
            left: 0,
            right: 0,

            child: SizedBox(
              height: 60,


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
                        Navigator.push(
                            context, MaterialPageRoute(
                                builder: (context) =>  HomePage(title: title,)
                            )
                        );

                      },
                    ),


                    Icon(fluIcon.FluentIcons.book_32_regular,
                        color: Color.fromRGBO(124, 156, 191, 1)),
                    Icon(fluIcon.FluentIcons.apps_32_regular,
                        color: Color.fromRGBO(124, 156, 191, 1)),
                    Icon(fluIcon.FluentIcons.chat_32_regular,
                        color: Color.fromRGBO(124, 156, 191, 1)),
                    Icon(fluIcon.FluentIcons.person_32_regular,
                        color: Color.fromRGBO(124, 156, 191, 1)),
                  ],
                ),


              )

            ),
          ),

        ],
      ),
    );
  }

}
