import 'package:gym_tracker/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class MaintenanceReportViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  int noteIndex = 0;

  List<String> onboardingNotes = [
    "assets/images/equip_detail.png",
    "assets/images/equip_detail.png",
    "assets/images/equip_detail.png",
    "assets/images/equip_detail.png",
    "assets/images/equip_detail.png",
  ];

  void goBack() => _navigationService.back();

  void logWorkoutNavigation() => _navigationService.navigateToLogWorkoutView();
  void reportIssuesNavigation() =>
      _navigationService.navigateToReportIssuesView();
  void maintenanceReportNavigation() =>
      _navigationService.navigateToMaintenanceView();

  void changeNote(int index) {
    noteIndex = index;
    notifyListeners();
  }
}
