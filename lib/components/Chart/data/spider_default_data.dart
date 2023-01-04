import 'package:flutter/material.dart';

import '../../../constants.dart';

class RawDataSet {
  RawDataSet({
    required this.title,
    required this.color,
    required this.values,
  });
  final String title;
  final Color color;
  final List<double> values;
}

List<RawDataSet> rawDataSets() {
  return [
    RawDataSet(
      title: 'Default',
      color: gridColor,
      values: [
        5,
        5,
        5,
        5,
        5,
      ],
    ),
    RawDataSet(
      title: 'Default',
      color: gridColor,
      values: [
        4,
        4,
        4,
        4,
        4,
      ],
    ),
    RawDataSet(
      title: 'Default',
      color: gridColor,
      values: [
        3,
        3,
        3,
        3,
        3,
      ],
    ),
    RawDataSet(
      title: 'Default',
      color: gridColor,
      values: [
        2,
        2,
        2,
        2,
        2,
      ],
    ),
    RawDataSet(
      title: 'Me',
      color: kPrimaryColor,
      values: [
        1,
        2,
        3,
        4,
        5,
      ],
    ),
  ];
}
