import 'package:flutter/material.dart';
import 'package:gym_tracker/core/models/onboarding_model.dart';
import 'package:gym_tracker/ui/common/app_colors.dart';

class OnboardingSlide extends StatelessWidget {
  final OnboardingModel model;
  const OnboardingSlide({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 410,
          width: double.infinity,
          child: Image(
            image: AssetImage(model.onboardingImgUrl),
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 80),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            model.onboardingTitle,
            style: const TextStyle(
                fontWeight: FontWeight.w700, fontSize: 24, color: kcTextColor1),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            model.onboardingDescription,
            style: const TextStyle(
                fontWeight: FontWeight.w400, fontSize: 18, color: kcTextColor2),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
