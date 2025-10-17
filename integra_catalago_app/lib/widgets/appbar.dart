import 'package:flutter/material.dart';

class Appbar extends StatelessWidget{
  const Appbar({super.key});

  @override
  Widget build(BuildContext context){
    const Color primaryColor = Colors.white;

    return AppBar(
      title: Text("Integra"),
      backgroundColor: primaryColor,
      toolbarHeight: 12,
    );
  }
}