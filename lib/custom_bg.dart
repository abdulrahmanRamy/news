import 'package:flutter/material.dart';

class CustomBg extends StatelessWidget {
  final Widget child;
  const CustomBg({required this.child,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: AssetImage("assets/pattern.png"))
      ),
      child: child,
    );
  }
}
