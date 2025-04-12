import 'package:flutter/material.dart';
import 'package:pulse_board_app/data/model/sensor/sensor_data_model.dart';

class AlertPanelWidget extends StatelessWidget {
  const AlertPanelWidget({super.key, required this.sensors});

  final List<SensorDataModel> sensors;

  @override
  Widget build(BuildContext context) {
    final alerts = sensors.where((s) => s.anomaly > 50).toList();
    if (alerts.isEmpty) return const SizedBox();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Icon(
            Icons.warning_amber_rounded,
            color: Colors.redAccent,
          ),
          title: Text(
            "High Anomaly Alerts",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...alerts.map(
                    (s) => Text(
                  "${s.id} (${s.location}) - Anomaly: ${s.anomaly.toStringAsFixed(1)}",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
