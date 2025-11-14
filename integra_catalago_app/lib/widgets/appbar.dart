import 'package:flutter/material.dart';

class IntegraAppBar extends StatelessWidget implements PreferredSizeWidget {
  const IntegraAppBar({super.key});

  final double _customHeight = 80;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Image.asset('assets/image/integraLogo.png', height: 120),
      backgroundColor: Colors.white,
      toolbarHeight: _customHeight,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
      ),

      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_customHeight);
}
