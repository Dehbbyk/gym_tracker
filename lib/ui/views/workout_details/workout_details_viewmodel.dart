import 'package:gym_tracker/app/app.locator.dart';
import 'package:gym_tracker/core/models/log_workout_model.dart';
import 'package:gym_tracker/services/log_workout_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.dialogs.dart';

class WorkoutDetailsViewModel extends BaseViewModel {
  final LogWorkoutService _logWorkoutService = locator<LogWorkoutService>();
  final _dialogService = locator<DialogService>();

  LogWorkoutModel? get loggedWorkOutDetails =>
      _logWorkoutService.selectedWorkout;

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.deleteWorkout,
    );
  }

  void editWorkout() {
    // Implement edit workout functionality
  }
}
