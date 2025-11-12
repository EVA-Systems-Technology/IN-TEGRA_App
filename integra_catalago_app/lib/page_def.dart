import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const DefPage());
}

class DefPage extends StatelessWidget {
  const DefPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(),
        body: Center(child: Container()),
      ),
    );
  }
}
