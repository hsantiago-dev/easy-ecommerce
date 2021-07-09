import 'package:easy/shared/login_google_button/login_google_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF28D890), Color(0xFFFFFFFF)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.25,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/personEasy.png',
                width: 290,
                height: 212,
              ),
            ),
            Positioned(
              bottom: size.height * 0.05,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Easy!',
                    style: GoogleFonts.lexendDeca(
                      fontSize: 32,
                      color: Color(0xFF555864),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: Text(
                      'Venda fácil!\n Encontre fácil!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lexendDeca(
                        fontSize: 25,
                        color: Color(0xFF878787),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60, left: 40, right: 40),
                    child: LoginGoogleButton(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
