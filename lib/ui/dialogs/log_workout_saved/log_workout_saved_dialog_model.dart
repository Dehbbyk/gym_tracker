import 'package:gym_tracker/app/app.router.dart';
import 'package:gym_tracker/services/app_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LogWorkoutSavedDialogModel extends BaseViewModel {
  final NavigationService _navigationService = NavigationService();
  final AppService _appService = AppService();

  void goToWorkOutHistory() {
    _appService.onItemTapped(3);
    _navigationService.replaceWith(Routes.dashboardView);
  }
}
