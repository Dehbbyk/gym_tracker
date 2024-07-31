import 'package:gym_tracker/app/app.dialogs.dart';
import 'package:gym_tracker/app/app.locator.dart';
import 'package:gym_tracker/core/models/log_workout_model.dart';
import 'package:gym_tracker/services/log_workout_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DeleteWorkoutDialogModel extends BaseViewModel {
  final DialogService _dialogSevvice = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  final LogWorkoutService _logWorkoutService = locator<LogWorkoutService>();

  LogWorkoutModel? get loggedWorkOutDetails =>
      _logWorkoutService.selectedWorkout;

  void confirmDelete() {
    _dialogSevvice.showCustomDialog(
        variant: DialogType.confirmDelete,
      data: loggedWorkOutDetails,

    );
  }
}
