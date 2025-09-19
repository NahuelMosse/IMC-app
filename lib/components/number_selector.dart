import 'package:flutter/material.dart';
import 'package:imc_app/core/app_colors.dart';
import 'package:imc_app/core/text_styles.dart';

class NumberSelector extends StatefulWidget {
  const NumberSelector({super.key, required this.title, required this.value, required this.onChange});

  final String title;
  final int value;
  final Function(int) onChange;

  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(widget.title, style: TextStyles.bodyStyle),
            ),
            Text('${widget.value}', style: TextStyles.boldStyle),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              child: Row(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: null,
                    backgroundColor: AppColors.primary,
                    shape: CircleBorder(),
                    onPressed: () {
                      widget.onChange(widget.value - 1);
                    },
                    child: Icon(Icons.remove, color: Colors.white),
                  ),
                  FloatingActionButton(
                    heroTag: null,
                    backgroundColor: AppColors.primary,
                    shape: CircleBorder(),
                    onPressed: () {
                      widget.onChange(widget.value + 1);
                    },
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}