import 'package:flutter/material.dart';

import '../components/movies_screen_components/movies_screen_body.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MoviesScreenBody(),
    );
  }
}
