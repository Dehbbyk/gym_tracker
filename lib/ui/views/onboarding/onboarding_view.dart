import 'package:flutter/material.dart';
import 'package:gym_tracker/ui/common/app_colors.dart';
import 'package:gym_tracker/ui/widgets/onboarding_slide.dart';
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
      body: SafeArea(
        child: Column(children: [
          Expanded(
              child: Center(
                child: PageView(
                  controller: viewModel.pageController,
                  onPageChanged: (index) => viewModel.changeNote(index),
                  children: List.generate(
                    viewModel.onboardingNotes.length,
                        (index) =>
                        OnboardingSlide(model: viewModel.onboardingNotes[index]),
                  ),
                ),
              )),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(viewModel.onboardingNotes.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: Container(
                  height: 8,
                  width: viewModel.noteIndex == index ? 32 : 8,
                  decoration: BoxDecoration(
                    shape: viewModel.noteIndex == index
                        ? BoxShape.rectangle
                        : BoxShape.circle,
                    color: viewModel.noteIndex == index
                        ? kcPrimaryColor
                        : const Color(0xffFDDCC5),
                  ),
                ),
              );
            }),
          ),
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
                      side: const BorderSide(color: Color(0xffCBD5E1)),
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
                const SizedBox(
                  height: 120,
                ),
                SizedBox(
                  height: 40,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: viewModel.next,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF97316),
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
        ]),
      ),
    );
  }

  @override
  OnboardingViewModel viewModelBuilder(
      BuildContext context,
      ) =>
      OnboardingViewModel();
}