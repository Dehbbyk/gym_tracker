import 'package:gym_tracker/app/app.locator.dart';
import 'package:gym_tracker/app/app.router.dart';
import 'package:gym_tracker/services/app_service.dart';
import 'package:gym_tracker/services/log_workout_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ConfirmDeleteDialogModel extends BaseViewModel {

  final _appService = locator<AppService>();
  final _navigationService = locator<NavigationService>();
  final _workoutService = locator<LogWorkoutService>();

  void deleteWorkout (){
    //_workoutService.deleteWorkout(workout)
  }

  void navigateToLoggedWorkouts (){
    _appService.onItemTapped(3);
    _navigationService.navigateTo(Routes.dashboardView);
  }
}
