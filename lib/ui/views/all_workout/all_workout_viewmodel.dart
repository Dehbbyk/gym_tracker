import 'package:gym_tracker/app/app.locator.dart';
import 'package:gym_tracker/app/app.router.dart';
import 'package:gym_tracker/core/models/log_workout_model.dart';
import 'package:gym_tracker/services/log_workout_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AllWorkoutViewModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();
  final _logWorkOutService = locator<LogWorkoutService>();

  List<LogWorkoutModel> get workOutLogs => _logWorkOutService.logWorkouts;

  void logWorkout() {
    _navigationService.navigateTo(Routes.logWorkoutView);
  }

  void equipmentDetailsNavigation() =>
      _navigationService.navigateToEquipmentDetailView();

  void goBack() => _navigationService.back();

  @override
  // TODO: implement listenableServices
  List<ListenableServiceMixin> get listenableServices => [_logWorkOutService];
}
