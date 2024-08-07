import 'package:flutter/material.dart';
import 'package:gym_tracker/ui/common/app_colors.dart';
import 'package:gym_tracker/ui/common/ui_helpers.dart';
import 'package:gym_tracker/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'confirm_delete_dialog_model.dart';

const double _graphicSize = 60;

class ConfirmDeleteDialog extends StackedView<ConfirmDeleteDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ConfirmDeleteDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ConfirmDeleteDialogModel viewModel,
    Widget? child,
  ) {
    return AlertDialog(
        content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/success.png', height: 100),
        const Text(
          'Log workout deleted',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        const Text(
          'Well-done your logged workout has been deleted.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 20),
        CustomButton(
          onPressed: viewModel.navigateToLoggedWorkouts,
          buttonText: 'Return to Logged Workouts',
        ),
      ],
    ));
  }

  @override
  ConfirmDeleteDialogModel viewModelBuilder(BuildContext context) =>
      ConfirmDeleteDialogModel();
}
