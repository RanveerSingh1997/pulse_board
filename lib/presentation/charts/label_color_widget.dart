import 'package:flutter/material.dart';

class AnomalyColorLegend extends StatelessWidget {
  const AnomalyColorLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 16,
          runSpacing: 10,
          children: const [
            _LegendItem(color: Colors.grey, label: "No Data / Offline"),
            _LegendItem(color: Colors.green, label: "Normal (Anomaly = 0)"),
            _LegendItem(color: Colors.yellow, label: "Warning (Anomaly ≤ 50)"),
            _LegendItem(color: Colors.red, label: "Critical (Anomaly > 50)"),
          ],
        ),
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black12),
          ),
        ),
        const SizedBox(width: 8),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
