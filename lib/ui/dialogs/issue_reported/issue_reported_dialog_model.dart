import 'package:gym_tracker/app/app.router.dart';
import 'package:gym_tracker/services/app_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class IssueReportedDialogModel extends BaseViewModel {
  final NavigationService _navigationService = NavigationService();
  final AppService _appService = AppService();

  void goToEquipmentDetails() {
    _appService.onItemTapped(0);
    _navigationService.replaceWith(Routes.dashboardView);
  }
}
