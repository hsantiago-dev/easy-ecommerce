import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final bool selecionado;
  const CircleIconButton({
    Key? key,
    required this.onTap,
    required this.icon,
    this.selecionado = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 65,
        height: 65,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          gradient: (selecionado)
              ? null
              : const LinearGradient(
                  colors: [Color(0xFF0EC4B7), Color(0xFF28D890)],
                ),
          color: (selecionado) ? Colors.grey : null,
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
