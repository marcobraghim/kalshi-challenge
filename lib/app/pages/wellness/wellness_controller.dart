import 'package:flutter/material.dart';
import 'package:kalshi/app/widgets/wellness_score_widget.dart';

class WellnessController {
  final formKey = GlobalKey<FormState>();

  WellnessScoreType? submit({
    required double income,
    required double costs,
  }) {
    if (formKey.currentState?.validate() ?? false) {
      var result = WellnessScoreType.low;

      final percentage = (costs * 100) / income;

      if (percentage < 25) {
        result = WellnessScoreType.high;
      } else if (percentage > 25 && percentage <= 75) {
        result = WellnessScoreType.medium;
      }
      return result;
    }
    return null;
  }
}
