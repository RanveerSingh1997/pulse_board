import 'package:flutter/material.dart';
import 'package:pulse_board_app/data/model/sensor/sensor_data_model.dart';
import 'package:pulse_board_app/data/model/sensor_detail/sensor_detail_model.dart';

import 'info_card_widget.dart';

class SummaryCardsWidget extends StatelessWidget {
  const SummaryCardsWidget({super.key, required this.sensor});

  final Summary sensor;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      runAlignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        InfoCardWidget(
          label: "Temperature",
          value: sensor.temperature.toStringAsFixed(1) ?? "?",
          icon: Icons.thermostat,
          color: Colors.orange,
        ),
        InfoCardWidget(
          label: "Humidity",
          value: sensor.humidity.toStringAsFixed(1) ?? "?",
          icon: Icons.water_drop,
          color: Colors.blue,
        ),
        InfoCardWidget(
          label: "Pressure",
          value: sensor.pressure.toStringAsFixed(1) ?? "?",
          icon: Icons.compress,
          color: Colors.purple,
        ),
        InfoCardWidget(
          label: "Anomaly",
          value: sensor.anomaly.toString(),
          icon: Icons.warning_amber,
          color: Colors.red,
        ),
      ],
    );
  }
}
