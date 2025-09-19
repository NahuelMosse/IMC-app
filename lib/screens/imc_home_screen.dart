import 'package:flutter/material.dart';
import 'package:imc_app/components/gender_selector.dart';
import 'package:imc_app/components/height_selector.dart';
import 'package:imc_app/components/number_selector.dart';
import 'package:imc_app/core/app_colors.dart';
import 'package:imc_app/core/text_styles.dart';
import 'package:imc_app/screens/imc_result_screen.dart';

class IMCHomeScreen extends StatefulWidget {
  const IMCHomeScreen({super.key});

  @override
  State<IMCHomeScreen> createState() => _IMCHomeScreenState();
}

class _IMCHomeScreenState extends State<IMCHomeScreen> {
  String? gender;
  double height = 170;
  int weight = 70;
  int age = 25;

  void genderSelectorHandler(String? value) {
    setState(() {
      gender = value;
    });
  }

  void heightSelectorHandler(double value) {
    setState(() {
      height = value;
    });
  }

  void weightSelectorHandler(int value) {
    setState(() {
      weight = value;
    });
  }

  void ageSelectorHandler(int value) {
    setState(() {
      age = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(
          gender: gender,
          onChange: genderSelectorHandler,
        ),
        HeightSelector(
          height: height,
          onChange: heightSelectorHandler,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
          child: Row(
            spacing: 16,
            children: [
              NumberSelector(title: 'Weight', value: weight, onChange: weightSelectorHandler),
              NumberSelector(title: 'Age', value: age, onChange: ageSelectorHandler),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IMCResultScreen(
                  weight: weight,
                  height: height,
                ))
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              minimumSize: Size(double.infinity, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
              )
            ),
            child: Text('Calculate', style: TextStyles.boldStyleWhite)),
        ),
      ],
    );
  }
}