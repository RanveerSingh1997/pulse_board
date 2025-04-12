import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulse_board_app/application/providers/sensor_data_provider.dart';
import 'package:pulse_board_app/shared/app_enums.dart';

class BubbleSizeToggleWidget extends StatelessWidget {
  const BubbleSizeToggleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        var metricType = ref.watch(metricTypeProvider);
        return ToggleButtons(
          isSelected: List.generate(
            MetricDataType.values.length,
            (index) => MetricDataType.values[index] == metricType,
          ),
          onPressed: (index) {
            ref.read(metricTypeProvider.notifier).state =
                MetricDataType.values[index];
          },
          borderRadius: BorderRadius.circular(8),
          constraints: BoxConstraints(minHeight: 40, minWidth: 100),
          children:
              MetricDataType.values.map((metric) => Text(metric.name)).toList(),
        );
      },
    );
  }
}
