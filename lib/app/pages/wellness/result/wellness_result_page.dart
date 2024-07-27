import 'package:flutter/material.dart';
import 'package:kalshi/app/widgets/custom_card_widget.dart';
import 'package:kalshi/app/widgets/custom_scaffold_widget.dart';
import 'package:kalshi/app/widgets/wellness_score_widget.dart';
import 'package:kalshi/core/theme.dart';

class WellnessResultPage extends StatefulWidget {
  final WellnessScoreType type;

  const WellnessResultPage({
    super.key,
    required this.type,
  });

  @override
  State<WellnessResultPage> createState() => _WellnessResultPageState();
}

class _WellnessResultPageState extends State<WellnessResultPage> {
  String title = 'Congratulations!';
  String subtitle = 'Your financial wellness score is';
  String subtitleBold = 'Healthy.';

  @override
  void initState() {
    super.initState();

    if (widget.type.isLow) {
      title = 'Caution!';
      subtitle = 'Your financial wellness score is';
      subtitleBold = 'Unhealthy.';
    } else if (widget.type.isMedium) {
      title = 'There is room for improvement.';
      subtitle = 'Your financial wellness score is';
      subtitleBold = 'Average.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWidget(
      child: Container(
        color: const Color(0xFFF4F8FA),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(text: "Here's your ", style: textSubtitle),
                      TextSpan(
                        text: "financial wellness\nscore.",
                        style: textSubtitleSemibold,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: CustomCardWidget(
                title: title,
                subtitle: subtitle,
                subtitleBold: subtitleBold,
                scoreType: widget.type,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  width: double.maxFinite,
                  child: SizedBox(
                    width: double.maxFinite,
                    height: 56,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          width: 2,
                          color: primaryColor,
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text('Return', style: textOutlinedButton),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                child: Column(
                  children: [
                    Image.asset('assets/images/Lock.png'),
                    const SizedBox(height: 16),
                    Text(
                      "Your financial information is encrypted and secure. We'll never share or sell any of your personal data.",
                      style: textDescription,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
