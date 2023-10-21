import 'dart:math';

import 'package:calculo_imc/shared/enum/enum_status_peso.dart';
import 'package:calculo_imc/shared/models/pessoa_model.dart';
import 'package:calculo_imc/widget/imc_gauge.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalculoPage extends StatefulWidget {
  const CalculoPage({super.key});

  @override
  State<CalculoPage> createState() => _CalculoPageState();
}

class _CalculoPageState extends State<CalculoPage> {
  final nomeEC = TextEditingController();
  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var pessoa = PessoaModel();

  double imc = 0.0;
  String status = 'informe campos necessários';

  var formatter = NumberFormat.simpleCurrency(
    locale: 'pt_BR',
  );

  Future<void> _calcularIMC({required double peso, required double altura}) async {
    setState(() {
      imc = 0;
    });

    await Future.delayed(Duration(seconds: 1));

    setState(() {
      imc = peso / pow(altura, 2);
      var checarStatus = StatusPeso.getStatusPeso(imc);
      status = checarStatus.valor;
      pessoa = PessoaModel(nome: nomeEC.text, altura: altura, peso: peso);
    });
  }

  @override
  void dispose() {
    nomeEC.dispose();
    pesoEC.dispose();
    alturaEC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculo IMC')),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ImcGauge(imc: imc),
                Center(
                  child: pessoa?.nome != null && pessoa?.nome.trim() != ''
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('nome: ', style: TextStyle(fontSize: 18)),
                                Text(pessoa.nome, style: TextStyle(fontSize: 18)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('altura: ', style: TextStyle(fontSize: 18)),
                                Text((pessoa.altura).toString(), style: TextStyle(fontSize: 18)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('imc: ', style: TextStyle(fontSize: 18)),
                                Text((imc).toStringAsFixed(2), style: TextStyle(fontSize: 18)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('peso: ', style: TextStyle(fontSize: 18)),
                                Text((pessoa.peso).toString(), style: TextStyle(fontSize: 18)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('status: ', style: TextStyle(fontSize: 18)),
                                Text(status, style: TextStyle(fontSize: 18)),
                              ],
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(status, style: TextStyle(fontSize: 18)),
                          ],
                        ),
                ),
                TextFormField(
                  controller: nomeEC,
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Nome obrigatório';
                    }
                  },
                ),
                TextFormField(
                  controller: alturaEC,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                      locale: 'pt_BR',
                      symbol: '',
                      decimalDigits: 2,
                      turnOffGrouping: true,
                    )
                  ],
                  decoration: InputDecoration(labelText: 'Altura'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Altura obrigatório';
                    }
                  },
                ),
                TextFormField(
                  controller: pesoEC,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                      locale: 'pt_BR',
                      symbol: '',
                      decimalDigits: 2,
                      turnOffGrouping: true,
                    ),
                  ],
                  decoration: const InputDecoration(labelText: 'Peso'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Peso obrigatório';
                    }
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    var formValid = formKey.currentState?.validate() ?? false;
                    if (formValid) {
                      double peso = formatter.parse(pesoEC.text) as double;
                      double altura = formatter.parse(alturaEC.text) as double;

                      _calcularIMC(peso: peso, altura: altura);
                    }
                  },
                  child: Text('Calcular IMC'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
