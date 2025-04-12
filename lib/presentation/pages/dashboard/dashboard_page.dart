import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulse_board_app/app_route/app_routing.gr.dart';
import 'package:pulse_board_app/application/providers/sensor_data_provider.dart';
import 'package:pulse_board_app/application/providers/simulate_settings_provider.dart';
import 'package:pulse_board_app/data/model/sensor/sensor_data_model.dart';
import 'package:pulse_board_app/data/repo/sensor/simulation_data_provider.dart';
import 'package:pulse_board_app/presentation/charts/bubble_chart_widget.dart';
import 'package:pulse_board_app/presentation/charts/toggle_widget.dart';
import 'package:pulse_board_app/presentation/charts/label_color_widget.dart';
import 'package:pulse_board_app/presentation/common/responsive_widget.dart';
import 'package:pulse_board_app/presentation/pages/dashboard/widgets/alert_panel_widget.dart';
import 'package:pulse_board_app/presentation/pages/dashboard/widgets/recent_reading_widget.dart';
import 'package:pulse_board_app/presentation/pages/dashboard/widgets/sensor_state_row_widget.dart';

@RoutePage()
class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.listenManual(sensorDataProvider, (previous, next) {
        final settings = ref.read(simulationSettingsProvider);
        next.whenData((sensorData) {
          ref
              .read(sensorSimulatorProvider.notifier)
              .simulate(sensorData, settings);
        });
      });

      ref.listenManual(simulationSettingsProvider, (previous, next) {
        final sensorData = ref.read(sensorDataProvider).asData?.value;
        if (sensorData != null) {
          ref.read(sensorSimulatorProvider.notifier).simulate(sensorData, next);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final simulatedData = ref.watch(sensorSimulatorProvider);
    final metricType = ref.watch(metricTypeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.sunny_snowing),
            SizedBox(width: 10),
            const Text("Pulse Board"),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.router.push(SettingsRoute()),
          ),
        ],
      ),
      body: ResponsiveWidget(
        mobile: _buildMobileLayout(simulatedData, metricType),
        tablet: _buildMobileLayout(simulatedData, metricType),
        desktop: _buildDesktopLayout(simulatedData, metricType),
      ),
    );
  }

  Widget _buildMobileLayout(List<SensorDataModel> sensorData, metricType) {
    return ListView(
      children: [
        AlertPanelWidget(sensors: sensorData),
        const SizedBox(height: 16),
        SensorStatesRowWidget(sensors: sensorData),
        const SizedBox(height: 16),
        RecentReadingWidget(sensors: sensorData),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnomalyColorLegend(),
              const SizedBox(height: 8),
              BubbleSizeToggleWidget(),
            ],
          ),
        ),
        _buildChart(sensorData, metricType),
      ],
    );
  }

  Widget _buildDesktopLayout(List<SensorDataModel> sensorData, metricType) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AlertPanelWidget(sensors: sensorData),
                  const SizedBox(height: 16),
                  SensorStatesRowWidget(sensors: sensorData),
                  const SizedBox(height: 16),
                  RecentReadingWidget(sensors: sensorData),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: AnomalyColorLegend()),
                    SizedBox(width: 30),
                    BubbleSizeToggleWidget(),
                  ],
                ),
                Expanded(child: _buildChart(sensorData, metricType)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChart(List<SensorDataModel> sensorData, metricType) {
    return BubbleChartWidget(sensors: sensorData, sizeBy: metricType);
  }
}
