import 'package:bitmap/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'data/spider_default_data.dart';

class SpiderChart extends StatelessWidget {
  const SpiderChart({super.key});
  final int selectedDataSetIndex = -1;
  final double angleValue = 0;
  final bool relativeAngleMode = true;

  List<RadarDataSet> showingDataSets() {
    return rawDataSets().asMap().entries.map((entry) {
      final index = entry.key;
      final rawDataSet = entry.value;
      final isSelected = index == selectedDataSetIndex
          ? true
          : selectedDataSetIndex == -1
              ? true
              : false;

      return RadarDataSet(
        fillColor: isSelected
            ? rawDataSet.color.withOpacity(0.2)
            : rawDataSet.color.withOpacity(0.05),
        borderColor:
            isSelected ? rawDataSet.color : rawDataSet.color.withOpacity(0.25),
        entryRadius: isSelected ? 3 : 2,
        dataEntries:
            rawDataSet.values.map((e) => RadarEntry(value: e)).toList(),
        borderWidth: isSelected ? 2.3 : 2,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      child: RadarChart(
        RadarChartData(
          dataSets: showingDataSets(),
          radarBackgroundColor: Colors.transparent,
          borderData: FlBorderData(show: false),
          radarBorderData: const BorderSide(color: Colors.transparent),
          titlePositionPercentageOffset: 0.2,
          titleTextStyle:
              const TextStyle(color: spiderTitleColor, fontSize: 14),
          getTitle: (index, angle) {
            final usedAngle =
                relativeAngleMode ? angle + angleValue : angleValue;
            switch (index) {
              case 0:
                return RadarChartTitle(
                  text: 'Technology',
                  angle: usedAngle,
                );
              case 1:
                return RadarChartTitle(
                  text: 'Communication',
                  angle: usedAngle,
                );
              case 2:
                return RadarChartTitle(
                  text: 'Influence',
                  angle: usedAngle,
                );
              case 3:
                return RadarChartTitle(
                  text: 'Process',
                  angle: usedAngle,
                );
              case 4:
                return RadarChartTitle(text: 'System', angle: usedAngle);
              default:
                return const RadarChartTitle(text: 'Unknown', angle: 0);
            }
          },
          ticksTextStyle:
              const TextStyle(color: Colors.transparent, fontSize: 10),
          tickBorderData: const BorderSide(color: Colors.transparent),
          gridBorderData: const BorderSide(color: spiderGridColor, width: 2),
        ),
        swapAnimationDuration: const Duration(milliseconds: 400),
      ),
    );
  }
}
