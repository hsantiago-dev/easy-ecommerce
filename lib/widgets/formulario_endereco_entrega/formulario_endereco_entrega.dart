import 'package:easy/repositories/endereco_entrega_repository.dart';
import 'package:easy/widgets/formulario_endereco_entrega/formulario_endereco_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FormularioEnderecoEntrega extends StatefulWidget {
  const FormularioEnderecoEntrega({Key? key}) : super(key: key);

  @override
  FormularioEnderecoEntregaState createState() =>
      FormularioEnderecoEntregaState();
}

class FormularioEnderecoEntregaState extends State<FormularioEnderecoEntrega> {
  @override
  Widget build(BuildContext context) {
    final controller = FormularioEnderecoController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.black87,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Column(
              children: [
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          controller: controller.cepController,
                          onEditingComplete: () => controller.buscaCepAPI(),
                          validator: controller.validarCep,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Digite o CEP',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: TextFormField(
                          controller: controller.logradouroController,
                          validator: controller.validarLogradouro,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Logradouro',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: TextFormField(
                          controller: controller.numeroController,
                          validator: controller.validarNumero,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Número',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: TextFormField(
                          controller: controller.bairroController,
                          validator: controller.validarBairro,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Bairro',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: TextFormField(
                          controller: controller.cidadeController,
                          validator: controller.validarCidade,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Cidade',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: TextFormField(
                          controller: controller.estadoController,
                          validator: controller.validarEstado,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Estado',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: Consumer<EnderecoEntregaRepository>(
          builder: (context, enderecos, child) {
            return Container(
              height: 60,
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: InkWell(
                  onTap: () {
                    if (controller.formKey.currentState!.validate()) {
                      enderecos.salvarEnderecosEntrega(
                          controller.retornarEndereco());
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'Salvar novo endereço',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF28D890),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
