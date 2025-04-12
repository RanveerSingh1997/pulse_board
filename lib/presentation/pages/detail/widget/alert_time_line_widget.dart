import 'package:flutter/material.dart';
import 'package:pulse_board_app/data/model/sensor_detail/sensor_detail_model.dart';

class AlertTimeLineWidget extends StatelessWidget {
  const AlertTimeLineWidget({super.key, required this.alerts});

  final List<Alert> alerts;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          "Alert History",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          children: [
            ...alerts.map(
              (e) => ListTile(
                leading: Icon(Icons.warning, color: Colors.red),
                title: Text(e.message ?? ""),
                subtitle: Text(e.time ?? ""),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
