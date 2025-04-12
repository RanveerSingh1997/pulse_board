import 'package:flutter/material.dart';
import 'package:pulse_board_app/data/model/sensor/sensor_data_model.dart';
import 'package:pulse_board_app/presentation/pages/dashboard/widgets/state_card_widget.dart';

class SensorStatesRowWidget extends StatelessWidget {
  const SensorStatesRowWidget({super.key, required this.sensors});

  final List<SensorDataModel> sensors;

  @override
  Widget build(BuildContext context) {
    final total = sensors.length;
    final offline = sensors.where((s) => s.status == 'offline').length;
    final anomalies = sensors.where((s) => s.anomaly > 0).length;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: StateCard(title: "Total", count: total)),
        Expanded(
          child: StateCard(
            title: "Offline",
            count: offline,
            color: Colors.grey,
          ),
        ),
        Expanded(
          child: StateCard(
            title: "Anomalies",
            count: anomalies,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
