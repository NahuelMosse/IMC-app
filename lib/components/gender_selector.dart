import 'package:flutter/material.dart';
import 'package:imc_app/core/app_colors.dart';
import 'package:imc_app/core/text_styles.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key, this.gender, required this.onChange});

  final String? gender;
  final Function(String) onChange;

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                widget.onChange('male');
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.gender == 'male'
                      ? AppColors.backgroundComponentSelected
                      : AppColors.backgroundComponent,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      spacing: 8,
                      children: [
                        Image.asset(
                          'assets/images/male.png',
                          height: 110,
                        ),
                        Text('Male', style: TextStyles.bodyStyle),
                      ]
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                widget.onChange('female');
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.gender == 'female'
                      ? AppColors.backgroundComponentSelected
                      : AppColors.backgroundComponent,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    spacing: 8,
                    children: [
                      Image.asset(
                      'assets/images/female.webp',
                      height: 130,
                    ),
                    Text('Female', style: TextStyles.bodyStyle),
                    ]
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}