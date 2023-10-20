class StatusPeso {
  final String valor;
  final double peso;

  const StatusPeso._(this.valor, this.peso);

  static StatusPeso magrezaGrave = const StatusPeso._('Magreza grave', 16);
  static StatusPeso magrezaModerada = const StatusPeso._('Magreza moderada', 17);
  static StatusPeso magrezaLeve = const StatusPeso._('Magreza leve', 18.5);
  static StatusPeso saudavel = const StatusPeso._('Saudável', 25);
  static StatusPeso sobrepeso = const StatusPeso._('Sobrepeso', 30);
  static StatusPeso obesidadeGrau1 = const StatusPeso._('Obesidade Grau I', 35);
  static StatusPeso obesidadeGrau2 = const StatusPeso._('Obesidade Grau II (severa)', 40);
  static StatusPeso obesidadeGrau3 = const StatusPeso._('Obesidade Grau III (mórbida)', 41);

  static StatusPeso getStatusPeso(double checkPeso) {
    // var List<StatusPeso> listaStatus
    final List<StatusPeso> listaStatus = [
      magrezaGrave,
      magrezaModerada,
      magrezaLeve,
      saudavel,
      sobrepeso,
      obesidadeGrau1,
      obesidadeGrau2,
      obesidadeGrau3,
    ];

    for (var status in listaStatus) {
      if (checkPeso <= status.peso) {
        return status;
      }
    }
    return obesidadeGrau3;
  }
}
