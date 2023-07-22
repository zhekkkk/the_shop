import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_shop/assets/color_schemes.g.dart';
import 'package:the_shop/navigation/app_router.dart';
import 'package:the_shop/pages/catalog_page/catalog_page.dart';

class TheShopApp extends StatelessWidget {
  TheShopApp({super.key});

  final AppRouter _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router.config(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme: lightColorScheme,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          headlineMedium: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          headlineSmall: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          bodyLarge: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
