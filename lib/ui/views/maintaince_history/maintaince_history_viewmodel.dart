import 'package:gym_tracker/app/app.locator.dart';
import 'package:gym_tracker/app/app.router.dart';
import 'package:gym_tracker/services/app_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MaintainceHistoryViewModel extends BaseViewModel {
  final _navigatinoService = locator<NavigationService>();
  final _appService = locator<AppService>();

  void navigateToEquipment() {
    _appService.onItemTapped(0);
    _navigatinoService.navigateTo(Routes.dashboardView);
  }
}
