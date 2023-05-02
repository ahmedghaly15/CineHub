import 'package:cine_app/core/utils/constants.dart';
import 'package:cine_app/core/utils/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'movies/presentation/screens/movies_screen.dart';

void main() {
  ServicesLocator().setupServiceLocator();
  runApp(const Cine());
}

class Cine extends StatelessWidget {
  const Cine({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cine App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      ),
      home: const MoviesScreen(),
    );
  }
}
