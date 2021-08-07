import 'package:easy/services/auth_service.dart';
import 'package:easy/widgets/login_social_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = AuthService();

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
              decoration: const BoxDecoration(
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
                      color: const Color(0xFF555864),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Text(
                      'Encontre fácil!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lexendDeca(
                        fontSize: 25,
                        color: const Color(0xFF878787),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 42, left: 40, right: 40),
                    child: LoginSocialButton(
                      onTap: () {
                        controller.googleSignIn();
                      },
                      textoBotao: 'Entrar com Google',
                      logo: 'assets/images/google.png',
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 40, right: 40),
                    child: LoginSocialButton(
                      onTap: () {
                        controller.facebookSignIn();
                      },
                      textoBotao: 'Entrar com Facebook',
                      logo: 'assets/images/facebook.png',
                      corFundo: 0xFF45619d,
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
