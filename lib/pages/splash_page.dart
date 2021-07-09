import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> irParaProximaPage() async {
      await Future.delayed(Duration(seconds: 3));

      Navigator.pushReplacementNamed(context, '/login');
    }

    irParaProximaPage();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF28D890), Color(0xFF0EC4B7)],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/easy.png',
                ),
                Text(
                  'Easy!',
                  style: GoogleFonts.lexendDeca(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
