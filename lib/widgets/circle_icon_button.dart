import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  const CircleIconButton({
    Key? key,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 65,
        height: 65,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0EC4B7), Color(0xFF28D890)],
          ),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 34,
        ),
      ),
    );
  }
}
