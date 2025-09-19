import 'package:flutter/material.dart';
import 'package:imc_app/core/app_colors.dart';
import 'package:imc_app/core/text_styles.dart';

class IMCResultScreen extends StatelessWidget {
  const IMCResultScreen({super.key, required this.weight, required this.height});

  final int weight;
  final double height;

  double calculateIMC(int weight, double height) {
    return weight / ((height / 100) * (height / 100));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IMC Calculator", style: TextStyles.boldStyleWhite),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: SizedBox(
            width: 300,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.backgroundComponent,
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16,
                children: [
                  Text(
                    'Your IMC is:',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    calculateIMC(weight, height).toStringAsFixed(2),
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}