import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'imc_gauge_range.dart';

class ImcGauge extends StatelessWidget {
  final double imc;

  const ImcGauge({super.key, required this.imc});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: [
        RadialAxis(
          showLabels: false,
          showAxisLine: false,
          showTicks: false,
          minimum: 11,
          maximum: 45,
          ranges: [
            ImcGaugeRange(
              color: Colors.blue[900]!,
              start: 11,
              end: 16,
              label: '',
            ),
            ImcGaugeRange(
              color: Colors.teal[800]!,
              start: 16,
              end: 17,
              label: '',
            ),
            ImcGaugeRange(
              color: Colors.green[800]!,
              start: 17,
              end: 18.5,
              label: '',
            ),
            ImcGaugeRange(
              color: Colors.green,
              start: 18.5,
              end: 25,
              label: '',
            ),
            ImcGaugeRange(
              color: Colors.yellow,
              start: 25,
              end: 30,
              label: '',
            ),
            ImcGaugeRange(
              color: Colors.orange[900]!,
              start: 30,
              end: 35,
              label: '',
            ),
            ImcGaugeRange(
              color: Colors.red[500]!,
              start: 35,
              end: 40,
              label: '',
            ),
            ImcGaugeRange(
              color: Colors.red[900]!,
              start: 40,
              end: 45,
              label: '',
            )
          ],
          pointers: [
            NeedlePointer(
              value: imc,
              enableAnimation: true,
            ),
          ],
        ),
      ],
    );
  }
}
