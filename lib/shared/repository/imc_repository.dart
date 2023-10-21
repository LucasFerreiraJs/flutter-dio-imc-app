import 'package:calculo_imc/shared/adapter/Imc_model_adapter.dart';
import 'package:calculo_imc/shared/models/imc_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ImcRepository extends ChangeNotifier {
  static late Box<ImcModel> box;

  static Future<ImcRepository> load() async {
    Hive.registerAdapter(ImcModelAdapter());
    box = await Hive.openBox<ImcModel>('imclist');
    return ImcRepository(); // Directly create and return an instance
  }

  Future<void> addImc(ImcModel imc) async {
    await box.add(imc);
    notifyListeners();
  }

  List<ImcModel> getImcs() {
    return box.values.toList();
  }
}
