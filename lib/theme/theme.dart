import 'package:flutter/material.dart';

final Color primaryColor = Color.fromARGB(255, 130, 70, 140);
final Color customColor = Color.fromARGB(255, 44, 7, 50);

final ThemeData temaAlquilemos = ThemeData(
  primaryColor: Color.fromARGB(255, 130, 70, 140),
  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(255, 130, 70, 140),
  ),

  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: MaterialColor(
      primaryColor.value,
      <int, Color>{
        50: primaryColor,
        100: primaryColor,
        200: primaryColor,
        300: primaryColor,
        400: primaryColor,
        500: primaryColor,
        600: primaryColor,
        700: primaryColor,
        800: primaryColor,
        900: primaryColor,
      },
    ),
    accentColor: customColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color.fromARGB(255, 130, 70, 140),
    selectedItemColor: Colors.white,
    unselectedItemColor:
        Colors.white.withOpacity(0.6), // Color para ítems no seleccionados
  ),
);

final TextStyle titulosPrincipales = TextStyle(
  fontFamily: 'Lobster',
  fontSize: 40, // No puedo implementar estos fontSize: size.width * 0.08,
  color: Color.fromARGB(255, 130, 70, 140),
);

final TextStyle titulosPrincipalesBlanco = TextStyle(
  fontFamily: 'Lobster',
  fontSize: 40, // No puedo implementar estos fontSize: size.width * 0.08,
  color: Colors.white,
);

final TextStyle titulosSecundario = TextStyle(
  fontFamily: 'Lobster',
  fontSize: 20, // No puedo implementar estos fontSize: size.width * 0.08,
  color: Colors.black,
);

final TextStyle infoSecundaria = TextStyle(
    fontSize: 22, // No puedo implementar estos fontSize: size.width * 0.08,
    color: Colors.black,
    fontStyle: FontStyle.italic);

class BotonAlquilemos {
  BotonAlquilemos._();

  static const primaryColor = Color.fromARGB(255, 130, 70, 140);
  static const primaryColorLight = Color.fromARGB(255, 242, 215, 247);

  /// Accent color
  static const secondaryColor = Color(0xFF9BC53D);
  static const backGroundColor = Color(0xFFFFFFFF);
  static const fontColor = Color(0xFF404E4D);

  /// white = Color(0xFFFFFFFF);
  static const Color white = Color(0xFFFFFFFF);

  /// transparent = Color(0x00000000);
  static const Color transparent = Color(0x00000000);
}

    
