import 'dart:math';

class ImcModel {
  final num peso;
  final num altura;
  late num imc;

  ImcModel({required this.peso, required this.altura}) {
    if (this.peso != 0 && this.altura != 0) {
      imc = calcularImc();
    } else {
      imc = 0.0;
    }
  }

  num calcularImc() {
    return peso / pow(altura, 2);
  }
}
