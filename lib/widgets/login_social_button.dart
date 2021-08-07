import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginSocialButton extends StatelessWidget {
  final VoidCallback onTap;
  final String logo;
  final String textoBotao;
  final int? corFundo;

  const LoginSocialButton({
    Key? key,
    required this.onTap,
    required this.logo,
    required this.textoBotao,
    this.corFundo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: Color((corFundo == null) ? 0xFFFAFAFC : corFundo!),
          borderRadius: BorderRadius.circular(5),
          border: const Border.fromBorderSide(
            BorderSide(color: Color(0xFFE3E3E6)),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(logo),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    height: 56,
                    width: 1,
                    color: const Color(0xFFE3E3E6),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textoBotao,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color:
                          Color((corFundo == null) ? 0xFF585666 : 0xFFFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
