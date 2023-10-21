import 'dart:math';

import 'package:calculo_imc/shared/enum/enum_status_peso.dart';
import 'package:calculo_imc/shared/models/imc_model.dart';
import 'package:calculo_imc/shared/models/pessoa_model.dart';
import 'package:calculo_imc/widget/imc_gauge.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({super.key});

  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  final List<ImcModel> imcList = [
    ImcModel(peso: 70, altura: 1.71),
    ImcModel(peso: 80, altura: 1.82),
    ImcModel(peso: 90, altura: 1.93),
    ImcModel(peso: 90, altura: 1.93),
    ImcModel(peso: 90, altura: 1.93),
    ImcModel(peso: 90, altura: 1.93),
    ImcModel(peso: 90, altura: 1.93),
    ImcModel(peso: 90, altura: 1.93),
    ImcModel(peso: 90, altura: 1.93),
    ImcModel(peso: 90, altura: 1.93),
    ImcModel(peso: 90, altura: 1.93),
    ImcModel(peso: 90, altura: 1.93),
    ImcModel(peso: 90, altura: 1.93),
    ImcModel(peso: 90, altura: 1.93),
    ImcModel(peso: 90, altura: 1.93),
    ImcModel(peso: 90, altura: 1.93),
    ImcModel(peso: 90, altura: 1.93),
    ImcModel(peso: 90, altura: 1.93),
    ImcModel(peso: 90, altura: 1.93),
    ImcModel(peso: 90, altura: 1.93),
    ImcModel(peso: 90, altura: 1.93),
    ImcModel(peso: 90, altura: 1.93),
  ];

  var formatter = NumberFormat.simpleCurrency(
    locale: 'pt_BR',
  );

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculo IMC')),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Peso')),
                  DataColumn(label: Text('Altura')),
                  DataColumn(label: Text('IMC')),
                ],
                rows: [
                  for (var imcItem in imcList)
                    DataRow(cells: [
                      DataCell(Text(imcItem.peso.toString())),
                      DataCell(Text(imcItem.altura.toString())),
                      DataCell(Text(imcItem.imc.toStringAsFixed(2))),
                    ])
                ],
              )),
        ),
      ),
    );
  }
}


//  ListView.builder(
//           itemCount: imcList.length,
//           itemBuilder: (context, index) {
//             final imc = imcList[index];
//             return ListTile(
//               title: Text(imc.peso.toString()),
//               subtitle: Text(imc.altura.toString()),
//               trailing: Text(imc.imc.toStringAsFixed(2)),
//             );
//           },
//         ));