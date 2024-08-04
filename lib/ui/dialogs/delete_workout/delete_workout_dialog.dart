import 'package:flutter/material.dart';
import 'package:gym_tracker/ui/common/app_colors.dart';
import 'package:gym_tracker/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'delete_workout_dialog_model.dart';

const double _graphicSize = 60;

class DeleteWorkoutDialog extends StackedView<DeleteWorkoutDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const DeleteWorkoutDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DeleteWorkoutDialogModel viewModel,
    Widget? child,
  ) {
    return AlertDialog(
      title: const Text('Delete Logged Workout'),
      content: const Text(
          'Are you sure you want to delete this logged workout? This action cannot be undone.'),
      actions: [
        TextButton(
          onPressed: () {
            completer(DialogResponse(
              confirmed: true,
            ));
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: viewModel.confirmDelete,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, // Button color
          ),
          child: const Text(
            'Delete',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  @override
  DeleteWorkoutDialogModel viewModelBuilder(BuildContext context) =>
      DeleteWorkoutDialogModel();
}
