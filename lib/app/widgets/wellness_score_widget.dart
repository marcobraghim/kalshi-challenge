import 'package:flutter/material.dart';

enum WellnessScoreType {
  low,
  medium,
  high;

  bool get isLow => this == WellnessScoreType.low;
  bool get isMedium => this == WellnessScoreType.medium;
  bool get isHigh => this == WellnessScoreType.high;
}

class WellnessScoreWidget extends StatelessWidget {
  final WellnessScoreType type;

  final highColor = const Color(0xFF04C761);
  final mediumColor = const Color(0xFFFFC032);
  final lowColor = const Color(0xFFD32A36);
  final emptyColor = const Color(0xFFE9EEF2);

  const WellnessScoreWidget({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: type == WellnessScoreType.high ? highColor : emptyColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            height: 16,
            width: double.maxFinite,
          ),
          Container(
            decoration: BoxDecoration(
              color: type == WellnessScoreType.high
                  ? highColor
                  : type == WellnessScoreType.medium
                      ? mediumColor
                      : emptyColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            height: 16,
            width: MediaQuery.sizeOf(context).width * .60,
          ),
          Container(
            decoration: BoxDecoration(
              color: type == WellnessScoreType.high
                  ? highColor
                  : type == WellnessScoreType.medium
                      ? mediumColor
                      : lowColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            height: 16,
            width: MediaQuery.sizeOf(context).width * .30,
          ),
        ],
      ),
    );
  }
}
