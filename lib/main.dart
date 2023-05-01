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
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
