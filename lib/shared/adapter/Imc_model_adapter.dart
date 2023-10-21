import 'package:calculo_imc/shared/models/imc_model.dart';
import 'package:hive/hive.dart';

class ImcModelAdapter extends TypeAdapter<ImcModel> {
  @override
  final int typeId = 0; // Identificador exclusivo para o modelo

  @override
  ImcModel read(BinaryReader reader) {
    final peso = reader.readDouble();
    final altura = reader.readDouble();
    return ImcModel(peso: peso, altura: altura);
  }

  @override
  void write(BinaryWriter writer, ImcModel obj) {
    writer.writeDouble(obj.peso.toDouble());
    writer.writeDouble(obj.altura.toDouble());
    writer.writeDouble(obj.imc.toDouble());
  }
}
