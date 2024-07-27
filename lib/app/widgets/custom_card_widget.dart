import 'package:flutter/material.dart';
import 'package:kalshi/app/widgets/wellness_score_widget.dart';
import 'package:kalshi/core/theme.dart';

class CustomCardWidget extends StatelessWidget {
  final WellnessScoreType? scoreType;
  final String title;
  final String subtitle;
  final String? subtitleBold;
  final Widget? child;

  const CustomCardWidget({
    super.key,
    this.scoreType,
    required this.title,
    required this.subtitle,
    this.subtitleBold,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 10,
            color: Color(0x1E2A3214),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png'),
          if (scoreType != null)
            WellnessScoreWidget(type: scoreType!)
          else
            const SizedBox(height: 16),
          Text(title, style: textHeadingSmall),
          Text(subtitle, style: textParagraph),
          if (subtitleBold != null)
            Text(subtitleBold!, style: textParagraphBold),
          if (child != null) child!,
        ],
      ),
    );
  }
}
