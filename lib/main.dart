import 'package:flutter/material.dart';

void main() {
  runApp(const Cine());
}

class Cine extends StatelessWidget {
  const Cine({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Lets learn together i want to contribute\nin movie app for bloc',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
