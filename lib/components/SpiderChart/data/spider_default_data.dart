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
      color: kPrimaryColor.withOpacity(0.5),
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
      color: spiderWebColor.withOpacity(0.2),
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
      color: spiderWebColor.withOpacity(0.2),
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
      color: spiderWebColor.withOpacity(0.2),
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
      color: spiderColor,
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
