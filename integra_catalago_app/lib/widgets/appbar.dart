import 'package:flutter/material.dart';

class IntegraAppBar extends StatelessWidget implements PreferredSizeWidget{
  const IntegraAppBar({super.key});

  final double _customHeight = 80;


  @override
  Widget build(BuildContext context){
    const Color primaryColor = Colors.white;

    

    return AppBar(
      title: Text("Integra"),
      backgroundColor: primaryColor,
      toolbarHeight: _customHeight,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_customHeight);
  

}
