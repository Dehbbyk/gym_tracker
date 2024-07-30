// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import '../ui/dialogs/issue_reported/issue_reported_dialog.dart';
import '../ui/dialogs/log_workout_saved/log_workout_saved_dialog.dart';

enum DialogType {
  infoAlert,
  logWorkoutSaved,
  issueReported,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.logWorkoutSaved: (context, request, completer) =>
        LogWorkoutSavedDialog(request: request, completer: completer),
    DialogType.issueReported: (context, request, completer) =>
        IssueReportedDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
