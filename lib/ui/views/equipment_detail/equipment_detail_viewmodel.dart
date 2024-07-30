import 'package:gym_tracker/app/app.locator.dart';
import 'package:gym_tracker/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EquipmentDetailViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  int noteIndex = 0;

  List<String> onboardingNotes = [
    "assets/images/equip_detail.png",
    "assets/images/equip_detail.png",
    "assets/images/equip_detail.png",
    "assets/images/equip_detail.png",
    "assets/images/equip_detail.png",
  ];

  void changeNote(int index) {
    noteIndex = index;
    notifyListeners();
  }

  void navigateToReportIssues() {
    _navigationService.navigateTo(Routes.reportIssuesView);
  }

  void navigateToLogWorkOut() {
    _navigationService.navigateTo(Routes.logWorkoutView);
  }

  void navigateToMaintenanceReport() {
    _navigationService.navigateTo(Routes.maintenanceReportView);
  }
}
