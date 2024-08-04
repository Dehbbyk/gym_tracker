import 'package:gym_tracker/app/app.locator.dart';
import 'package:gym_tracker/app/app.router.dart';
import 'package:gym_tracker/services/app_service.dart';
import 'package:gym_tracker/services/log_workout_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:gym_tracker/core/models/log_workout_model.dart';

class ConfirmDeleteDialogModel extends BaseViewModel {
  final AppService _appService = locator<AppService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final LogWorkoutService _workoutService = locator<LogWorkoutService>();

  // void deleteWorkout(LogWorkoutModel workout) {
  //   _workoutService.deleteWorkout(workout);
  //   navigateToLoggedWorkouts();
  // }

  void navigateToLoggedWorkouts() {
    _appService.onItemTapped(3);
    _navigationService.navigateTo(Routes.dashboardView);
  }
}
