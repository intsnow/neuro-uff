import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart' as fluIcon;
import 'package:flutter/rendering.dart';
import '../assets/constants/colors_scheme.dart'; // Mantido, mas a classe ColorsScheme não foi fornecida, assumindo que exista.

import 'home_page.dart';
import 'profile_page.dart'; // Importação circular, mas mantida conforme seu código original.


class ProfilePage extends StatefulWidget {
  final String title;
  final String userName;
  final ThemeData currentTheme;
  final Function(bool) onThemeChanged;

  const ProfilePage({
    super.key,
    required this.title,
    required this.userName,
    required this.currentTheme,
    required this.onThemeChanged,
  });

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isChangedTheme() {
    return Theme.of(context).brightness == Brightness.dark ? true : false;
  }

  Widget setCupertino_DecoratedBox(Widget child) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Theme.of(context).brightness == Brightness.dark
            ?   ColorsScheme.navBarBackgroundDark
            :   Colors.white,

        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.dark
                ?   ColorsScheme.neuroBlueLight
                :   CupertinoColors.systemGrey.withOpacity(0.3),

            blurStyle: BlurStyle.normal,
            spreadRadius: Theme.of(context).brightness == Brightness.dark
                ?  0 :  0,

            blurRadius:  Theme.of(context).brightness == Brightness.dark
                ?  0.05 :  2,

            offset:      Theme.of(context).brightness == Brightness.dark
                ?  const Offset(0, -0.1) :  const Offset(0, 2),

          ),
        ],

        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }

  void showDialog_IncompletaFuncao() {
    showAdaptiveDialog(
        context: context,
        builder: (BuildContext context) {

          return AlertDialog.adaptive(
            icon: Text(
              "INCOMPLETO...",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color:  Theme.of(context).brightness == Brightness.dark
                        ?  Colors.white
                        :  ColorsScheme.backgroundDark,
                fontFamily: "Segoe UI",
              ),
            ),

            content: Text(
              "Implementar função!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).brightness == Brightness.dark
                    ?  Colors.white
                    :  ColorsScheme.backgroundDark,
                fontFamily: "Segoe UI",
              ),
            ),
          );
        });
  }

  String getUsernameIniciais() {
    if (widget.userName.isEmpty) return "US";
    final parts = widget.userName.trim().split(' ');
    if (parts.length == 1) return parts[0][0].toUpperCase();
    if (parts.length >= 2) return (parts[0][0] + parts[1][0]).toUpperCase();
    return "US";
  }


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // final String title = super.widget.title;

    return LayoutBuilder(
      builder: (context, constraints){

        final w = constraints.maxWidth;
        final h = constraints.maxHeight;

        final avatarRadius = w * 0.25;
        final cameraRadius = avatarRadius * 0.75;
        final initialFontSize = avatarRadius * 0.55;

        return Scaffold(
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ?   ColorsScheme.backgroundDark
              :   ColorsScheme.backgroundLight,

          body: Center(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    const SizedBox(height: 60),

                    SizedBox(
                      // Altura e largura do Stack baseadas no diâmetro
                      height: avatarRadius * 2,
                      width: avatarRadius * 2,

                      child: Stack(
                        alignment: Alignment.center,

                        children: [
                          CircleAvatar(
                            radius: avatarRadius,
                            backgroundColor: Theme.of(context).brightness == Brightness.dark
                                ?   ColorsScheme.neuroBlueLight
                                :   ColorsScheme.neuroBlue,

                            child: CircleAvatar(
                              radius: avatarRadius * 0.93, // Borda interna
                              backgroundColor: Theme.of(context).brightness == Brightness.dark
                                  ?   Color.fromRGBO(61, 68, 84, 1)
                                  :   ColorsScheme.neuroBlueLight,

                              child: FittedBox(
                                fit: BoxFit.scaleDown,

                                child: Text(
                                  getUsernameIniciais(),

                                  style: TextStyle(
                                    fontSize: initialFontSize,
                                    color: Theme.of(context).brightness == Brightness.dark
                                        ? ColorsScheme.neuroBlueLight
                                        : ColorsScheme.neuroBlue,
                                    fontFamily: "Segoe UI",
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                            bottom: 0,
                            right: 0,

                            child: CircleAvatar(
                              radius: cameraRadius * 0.5, // Raio menor para o ícone
                              backgroundColor: Theme.of(context).brightness == Brightness.dark
                                  ?   ColorsScheme.neuroBlueLight
                                  :   ColorsScheme.neuroBlue,

                              child: IconButton(
                                  hoverColor: Colors.transparent,
                                  padding: const EdgeInsets.all(0),
                                  iconSize: cameraRadius * 0.6, // Tamanho do ícone baseado no tamanho da câmera

                                  onPressed: () => showDialog_IncompletaFuncao(),

                                  icon: Icon(
                                    Icons.photo_camera_outlined,
                                    color: Theme.of(context).brightness == Brightness.dark
                                        ?   Colors.black
                                        :   Colors.white,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 40,
                    ),

                    Text(
                      "UserName",//widget.userName, // Usando a variável original

                      style: TextStyle(
                        fontSize: 23,
                        fontFamily: "Lucida",
                        fontWeight: FontWeight.w500,
                        color:  Theme.of(context).brightness == Brightness.dark
                                ?   Colors.white
                                :   Colors.grey.shade800
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      textAlign: TextAlign.center,
                      "@id_name", //idName

                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Lucida",
                          color: Colors.grey.shade700),
                    ),

                    const SizedBox(
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

                    const SizedBox(
                      height: 40,
                    ),

                    SizedBox(
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.06,

                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(124, 156, 191, 10),
                            overlayColor: Colors.lightBlue.shade400,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),

                        onPressed: () {
                          showDialog_IncompletaFuncao();
                        },

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Icon(
                              fluIcon.FluentIcons.pen_48_regular,
                              color: Theme.of(context).brightness == Brightness.dark
                                  ?  Colors.black
                                  :  Colors.white,
                              size: screenHeight * 0.0255,
                            ),

                            const SizedBox(width: 30),
                            Text(
                              "Editar Perfil",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).brightness == Brightness.dark
                                      ?  Colors.black
                                      :  Colors.white,
                                  fontFamily: "Lucida",
                                  fontSize: screenHeight * 0.0195),
                            )
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                    SizedBox(
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.115,

                      child: setCupertino_DecoratedBox(
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Icon(
                                fluIcon.FluentIcons.weather_sunny_32_regular,
                                size: screenHeight * 0.0275,
                                color: Theme.of(context).brightness == Brightness.dark
                                       ?  ColorsScheme.neuroBlueLight
                                       :  ColorsScheme.neuroBlue,
                              ),

                              const Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text(
                                    "Tema Escuro",
                                    style: TextStyle(
                                        fontSize: screenHeight * 0.0195,
                                        fontFamily: "Segoe UI"),
                                  ),

                                  SizedBox(
                                    height: screenHeight * 0.005,
                                  ),
                                  Text(
                                      isChangedTheme() ? "Ativado" : "Desativado",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Segoe UI",
                                        color: Colors.grey,
                                      )),
                                ],
                              ),

                              const Spacer(), // Novo Spacer para centralizar o texto
                              Switch.adaptive(
                                  value: isChangedTheme(),
                                  activeTrackColor: ColorsScheme.neuroBlue,
                                  inactiveTrackColor: Color.fromRGBO(212, 212, 212, 1),
                                  hoverColor: Colors.transparent,

                                  thumbIcon: WidgetStateProperty.resolveWith( (Set states){
                                    return Icon(
                                        Icons.brightness_4_outlined,
                                        color: ColorsScheme.neuroBlue,
                                        size: 20

                                    );
                                  }),

                                  trackOutlineColor: WidgetStateProperty.resolveWith( (Set states){
                                     Color color =
                                        Theme.of(context).brightness == Brightness.dark
                                            ?   ColorsScheme.neuroBlueLight
                                            :   Colors.white;

                                      return color;
                                  }),

                                  thumbColor: WidgetStateProperty.resolveWith((Set states){
                                    Color color =
                                       Theme.of(context).brightness == Brightness.dark//states.contains(WidgetState.disabled)
                                        ?    Colors.white
                                        :    Colors.black;

                                     return color;
                                  }),

                                  onChanged: (bool value) {
                                    widget.onThemeChanged(value);
                                    setState(() {});
                                  })
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.315,

                      child: setCupertino_DecoratedBox(
                        Padding(
                          padding: EdgeInsets.only(
                            top: screenHeight * 0.0295,
                            left: screenWidth * 0.05,
                            right: screenWidth * 0.05,
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                "Informações",
                                style: TextStyle(
                                    fontSize: screenHeight * 0.029,
                                    fontFamily: "Segoe UI",
                                    color: Theme.of(context).brightness == Brightness.dark
                                        ?   Colors.grey
                                        :   Colors.grey.shade600,
                                  fontWeight: FontWeight.w500
                                ),
                              ),

                              const SizedBox(height: 20),
                              Row(

                                children: [
                                  Text(
                                      "Status:",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Segoe UI",
                                          color: Theme.of(context).brightness == Brightness.dark
                                              ? Colors.grey : Colors.grey.shade700)
                                  ),

                                  const Spacer(),
                                  // Usando Expanded para garantir que o texto não estoure
                                  Expanded(
                                    child: Text(
                                        "Ativo",
                                        textAlign: TextAlign.right, // Alinha à direita
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Segoe UI",
                                          color: Theme.of(context).brightness == Brightness.dark
                                              ? Colors.white : Colors.black,
                                          //fontWeight: FontWeight.bold,
                                        )
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Text(
                                      "Período de ingresso:",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Segoe UI",
                                          color: Theme.of(context).brightness == Brightness.dark
                                          ? Colors.grey : Colors.grey.shade700)
                                 ),

                                  const Spacer(),
                                  Expanded(
                                    child: Text(
                                        "2024.1",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Segoe UI",
                                          color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                                          fontWeight: FontWeight.w600,
                                        )
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 20),
                              // Curso
                              Row(
                                children: [
                                  Text(
                                      "Curso:",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Segoe UI",
                                          color: Theme.of(context).brightness == Brightness.dark
                                              ? Colors.grey : Colors.grey.shade700)
                                  ),

                                  const Spacer(),
                                  Expanded(
                                    child: Text(
                                        "Ciência da Computação",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Segoe UI",
                                          color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                                          //fontWeight: FontWeight.bold,
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                    SizedBox(
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.06,

                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Theme.of(context).brightness == Brightness.dark
                                             ?  Colors.redAccent
                                             :  Colors.red,

                            overlayColor: Colors.lightBlue.shade400,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),

                        onPressed: () {
                          showDialog_IncompletaFuncao();
                        },

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Icon(
                              fluIcon.FluentIcons.door_arrow_right_16_regular,
                              color: Theme.of(context).brightness == Brightness.dark
                                  ?  Colors.black
                                  :  Colors.white,
                              size: screenHeight * 0.0255,
                            ),

                            const SizedBox(width: 30),
                            Text(
                              "Sair da Conta",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).brightness == Brightness.dark
                                      ?  Colors.black
                                      :  Colors.white,
                                  fontFamily: "Segoe UI",
                                  fontSize: screenHeight * 0.0195),
                            )
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ),

          bottomNavigationBar: DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? ColorsScheme.navBarBackgroundDark
                  : ColorsScheme.backgroundLight,
            ),

            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [

                  IconButton(
                    hoverColor: Colors.transparent,
                    icon: Icon(
                        fluIcon.FluentIcons.home_32_regular,
                        color: ColorsScheme.neuroBlue,
                        size: screenHeight * 0.035
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
                    icon: Icon(fluIcon.FluentIcons.person_32_filled,
                        color: ColorsScheme.neuroBlue,
                        size: screenHeight * 0.035),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}