import 'package:gym_tracker/app/app.dialogs.dart';
import 'package:gym_tracker/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DeleteWorkoutDialogModel extends BaseViewModel {
  final DialogService _dialogSevvice = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  void confirmDelete() {
    _dialogSevvice.showCustomDialog(variant: DialogType.confirmDelete);
  }
}
