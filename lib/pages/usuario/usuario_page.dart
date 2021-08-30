import 'package:easy/pages/usuario/usuario_controller.dart';
import 'package:easy/services/auth_service.dart';
import 'package:easy/widgets/enderecos_entrega_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UsuarioPage extends StatefulWidget {
  const UsuarioPage({Key? key}) : super(key: key);

  @override
  State<UsuarioPage> createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  final formKey = GlobalKey<FormState>();
  final numeroCelularController = MaskedTextController(mask: '(00) 00000-0000');
  final cpfController = MaskedTextController(mask: '000.000.000-00');

  String? validarNumeroCelular(String? value) {
    if (value!.length < 15) {
      return 'o número de celular não está no formato ideal';
    }

    return null;
  }

  String? validarCpf(String? value) {
    if (value!.length < 14) {
      return 'o número de CPF não está no formato ideal';
    }

    return null;
  }

  _salvarAtualizacaoDados(UsuarioController controller) {
    if (formKey.currentState!.validate()) {
      controller.onChange(
        celular: numeroCelularController.text,
        cpf: cpfController.text,
      );

      numeroCelularController.text = '';
      cpfController.text = '';
      Navigator.of(context).pop();
    }
  }

  _abrirModalAtualizaDados(BuildContext context, UsuarioController controller) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: TextFormField(
                          controller: numeroCelularController,
                          validator: validarNumeroCelular,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Número de celular',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: TextFormField(
                          controller: cpfController,
                          validator: validarCpf,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CPF',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: InkWell(
                    onTap: () => _salvarAtualizacaoDados(controller),
                    child: Text(
                      'Salvar alterações',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF28D890),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF28D890), Color(0xFF0EC4B7)],
              ),
            ),
          ),
        ),
        body:
            Consumer<UsuarioController>(builder: (context, controller, child) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: NetworkImage(controller.usuario.fotoUrl),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.usuario.nome,
                                  style: GoogleFonts.lexendDeca(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Text(
                                    controller.usuario.email,
                                    style: GoogleFonts.lexendDeca(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Celular: ',
                                  style: GoogleFonts.lexendDeca(fontSize: 16),
                                ),
                                Text(
                                  (controller.usuario.celular!.isEmpty)
                                      ? 'Não informado'
                                      : controller.usuario.celular.toString(),
                                  style: GoogleFonts.lexendDeca(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'CPF: ',
                                  style: GoogleFonts.lexendDeca(fontSize: 16),
                                ),
                                Text(
                                  (controller.usuario.cpf!.isEmpty)
                                      ? 'Não informado'
                                      : controller.usuario.cpf.toString(),
                                  style: GoogleFonts.lexendDeca(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () =>
                              _abrirModalAtualizaDados(context, controller),
                          child: Text(
                            'Atualize seus dados',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: const Color(0xFF28D890),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 10,
                      ),
                      EnderecosEntregaWidget(),
                    ],
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                        colors: [Color(0xFFFF416C), Color(0xFFFF4B2B)]),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {
                      context.read<AuthService>().logout();
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 150,
                      alignment: Alignment.center,
                      child: Text(
                        'LOGOUT',
                        style: GoogleFonts.inter(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
