import 'package:flutter/material.dart';
import 'package:imc_app/core/app_colors.dart';
import 'package:imc_app/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  const HeightSelector({super.key, required this.height, required this.onChange});

  final double height;
  final Function(double) onChange;

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Text('Height', style: TextStyles.bodyStyle),
              Text('${widget.height.toStringAsFixed(1)} cm', style: TextStyles.boldStyle),
              Slider(
                value: widget.height,
                min: 100,
                max: 220,
                divisions: 120,
                activeColor: AppColors.primary,
                onChanged: (double newValue) {
                  widget.onChange(newValue);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}