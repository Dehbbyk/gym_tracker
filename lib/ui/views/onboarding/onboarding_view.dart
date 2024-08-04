import 'package:flutter/material.dart';
import 'package:gym_tracker/ui/common/app_colors.dart';
import 'package:gym_tracker/ui/widgets/onboarding_slide.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stacked/stacked.dart';

import 'onboarding_viewmodel.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnboardingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(children: [
        OnboardingSlide(model: viewModel.onboardingNotes[viewModel.noteIndex]),
        const SizedBox(
          height: 24,
        ),
        AnimatedSmoothIndicator(
          count: viewModel.onboardingNotes.length,
          activeIndex: viewModel.noteIndex,
          effect: ExpandingDotsEffect(
            spacing: 4,
            activeDotColor: kcPrimaryColor,
            dotWidth: 5,
            dotHeight: 5,
            expansionFactor: 4,
            dotColor: kcPrimaryColor.withOpacity(0.2),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 40,
                width: 100,
                child: OutlinedButton(
                  onPressed: viewModel.skip,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color(0xffCBD5E1),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 40,
                width: 100,
                child: ElevatedButton(
                  onPressed: viewModel.next,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF97316),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 0,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 76),
      ]),
    );
  }

  @override
  OnboardingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OnboardingViewModel();
}
