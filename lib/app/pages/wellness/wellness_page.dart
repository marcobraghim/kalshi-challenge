import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:kalshi/app/pages/wellness/result/wellness_result_page.dart';
import 'package:kalshi/app/pages/wellness/wellness_controller.dart';
import 'package:kalshi/app/widgets/custom_card_widget.dart';
import 'package:kalshi/app/widgets/custom_scaffold_widget.dart';
import 'package:kalshi/app/widgets/custom_text_form_field.dart';
import 'package:kalshi/core/theme.dart';

class WellnessPage extends StatefulWidget {
  const WellnessPage({super.key});

  @override
  State<WellnessPage> createState() => _WellnessPageState();
}

class _WellnessPageState extends State<WellnessPage> {
  final formatterIncome =
      CurrencyTextInputFormatter.currency(locale: 'en_US', symbol: '');
  final formatterCosts =
      CurrencyTextInputFormatter.currency(locale: 'en_US', symbol: '');

  final controller = WellnessController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWidget(
      child: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(text: "Let's find out your ", style: textSubtitle),
                    TextSpan(
                      text: "financial\nwellness score.",
                      style: textSubtitleSemibold,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: CustomCardWidget(
              title: 'Financial wellness test',
              subtitle: 'Enter your financial information below',
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                width: double.maxFinite,
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        controller: TextEditingController(),
                        title: 'Annual income',
                        inputFormatters: [formatterIncome],
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'This field is required';
                          } else if (formatterIncome.getDouble() == 0.0) {
                            return 'This value can not be zero';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        controller: TextEditingController(),
                        title: 'Monthly Costs',
                        inputFormatters: [formatterCosts],
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'This field is required';
                          } else if (formatterCosts.getDouble() == 0.0) {
                            return 'This value can not be zero';
                          } else if (formatterCosts.getDouble() >
                              formatterIncome.getDouble()) {
                            return 'This value can not be bigger than [Annual Income]';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.maxFinite,
                        height: 56,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: primaryColor,
                          ),
                          onPressed: () {
                            final result = controller.submit(
                              income: formatterIncome.getDouble(),
                              costs: formatterCosts.getDouble(),
                            );

                            if (result != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WellnessResultPage(
                                    type: result,
                                  ),
                                ),
                              );
                            }
                          },
                          child: Text('Continue', style: textFlatButton),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
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
    );
  }
}
