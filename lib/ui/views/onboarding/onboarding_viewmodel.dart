import 'package:flutter/material.dart';
import 'package:gym_tracker/app/app.locator.dart';
import 'package:gym_tracker/app/app.router.dart';
import 'package:gym_tracker/core/models/onboarding_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingViewModel extends BaseViewModel {
  final PageController pageController = PageController();
  final _navigationService = locator<NavigationService>();

  int noteIndex = 0;

  List<OnboardingModel> onboardingNotes = [
    const OnboardingModel(
        onboardingImgUrl: "assets/images/onboarding_img2.png",
        onboardingTitle: "Welcome to Gym Tracker!",
        onboardingDescription: "Your personalized fitness companion is here."),
    const OnboardingModel(
        onboardingImgUrl: "assets/images/onboarding_img1.png",
        onboardingTitle: "Access equipment guide",
        onboardingDescription:
            "View detailed instructions and videos for each equipment."),
    const OnboardingModel(
        onboardingImgUrl: "assets/images/onboarding_img3.png",
        onboardingTitle: "Track Your Progress",
        onboardingDescription:
            "Keep a detailed log of your exercises and monitor your improvements over time.")
  ];

  void changeNote(int index) {
    noteIndex = index;
    notifyListeners();
  }

  void next() {
    if (noteIndex < onboardingNotes.length - 1) {
      noteIndex++;
      notifyListeners();
    } else {
      _navigationService.navigateTo(Routes.maintenanceView);
    }
  }

  void skip() {
    _navigationService.navigateTo(Routes.maintenanceView);
  }
}
