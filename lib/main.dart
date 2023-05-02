import 'package:bloc/bloc.dart';
import 'package:cine_app/core/utils/constants.dart';
import 'package:cine_app/core/utils/services_locator.dart';
import 'package:cine_app/movies/presentation/screens/movies_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/utils/my_bloc_observer.dart';

// TODO : Handle Exception like No internt Such As in BookHive

void main() {
  Bloc.observer = MyBlocObserver();
  ServicesLocator().setupServiceLocator();
  runApp(const CineHub());
}

class CineHub extends StatelessWidget {
  const CineHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CineHub App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      ),
      home: const MoviesScreen(),
    );
  }
}
