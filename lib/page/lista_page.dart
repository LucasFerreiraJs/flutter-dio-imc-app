import 'dart:math';

import 'package:calculo_imc/shared/enum/enum_status_peso.dart';
import 'package:calculo_imc/shared/models/imc_model.dart';
import 'package:calculo_imc/shared/models/pessoa_model.dart';
import 'package:calculo_imc/shared/repository/imc_repository.dart';
import 'package:calculo_imc/widget/imc_gauge.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ListaPage extends StatefulWidget {
  final BuildContext ctx;

  const ListaPage({super.key, required this.ctx});

  @override
  State<ListaPage> createState() => _ListaPageState(ctx: ctx);
}

class _ListaPageState extends State<ListaPage> {
  final BuildContext ctx;
  late ImcRepository imcRepository;

  _ListaPageState({required this.ctx});

  var formatter = NumberFormat.simpleCurrency(
    locale: 'pt_BR',
  );

  @override
  void initState() {
    super.initState();
    imcRepository = Provider.of<ImcRepository>(ctx, listen: false);

    // for (var item in imcList) {
    //   imcRepository.addImc(item);
    // }
  }

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
                  for (var imcItem in imcRepository.getImcs())
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