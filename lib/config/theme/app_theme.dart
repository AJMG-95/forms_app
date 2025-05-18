import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    const seedColor = Colors.deepPurple;

    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seedColor,
      fontFamily: 'Roboto',

      // 🎨 Puedes personalizar también el color del icono en ListTile
      listTileTheme: const ListTileThemeData(iconColor: seedColor),

      // 🧩 Estilo de texto global
      textTheme: const TextTheme(
        // Estilo principal para textos grandes
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black), // Regular
        // Estilo intermedio para cuerpo de texto
        bodyMedium: TextStyle( fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black), // Regular
        // Estilo pequeño
        bodySmall: TextStyle( fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black87), // Regular
        // Titulares pequeños
        headlineSmall: TextStyle( fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black,),
        // Título más grande
        titleLarge: TextStyle( fontSize: 22, fontWeight: FontWeight.w600,color: Colors.black), // Semibold
        // Título medio
        titleMedium: TextStyle( fontSize: 18, fontWeight: FontWeight.w500,color: Colors.black), // Medium
        // Título pequeño
        titleSmall: TextStyle( fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black,),
        // Botones, etiquetas, etc.
        labelLarge: TextStyle( fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white,),
        labelMedium: TextStyle( fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white,),
        labelSmall: TextStyle( fontSize: 10, fontWeight: FontWeight.w300, color: Colors.white,),
      ),
    );
  }
}
