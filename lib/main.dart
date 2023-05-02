import 'package:cine_app/core/utils/services_locator.dart';
import 'package:flutter/material.dart';

import 'movies/presentation/screens/movies_screen.dart';

void main() {
  ServicesLocator().setupServiceLocator();
  runApp(const Cine());
}

class Cine extends StatelessWidget {
  const Cine({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cine App',
      home: MoviesScreen(),
    );
  }
}
