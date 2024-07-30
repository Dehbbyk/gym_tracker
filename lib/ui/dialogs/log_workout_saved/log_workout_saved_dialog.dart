import 'package:flutter/material.dart';
import 'package:gym_tracker/ui/common/app_colors.dart';
import 'package:gym_tracker/ui/common/ui_helpers.dart';
import 'package:gym_tracker/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'log_workout_saved_dialog_model.dart';

const double _graphicSize = 60;

class LogWorkoutSavedDialog extends StackedView<LogWorkoutSavedDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const LogWorkoutSavedDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LogWorkoutSavedDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.white,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("assets/images/workout_empty_img.png"),
                    height: 160,
                    width: 160,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Log workout saved",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: kcTextColor1),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Well-done you log workout has been saved.",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: kcTextColor2),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomButton(
                    buttonText: "Go to Workout History",
                    onPressed: viewModel.goToWorkOutHistory,
                  )
                ],
              ),
            ])));
  }

  @override
  LogWorkoutSavedDialogModel viewModelBuilder(BuildContext context) =>
      LogWorkoutSavedDialogModel();
}
