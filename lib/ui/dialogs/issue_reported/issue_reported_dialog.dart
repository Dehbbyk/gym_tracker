import 'package:flutter/material.dart';
import 'package:gym_tracker/ui/common/app_colors.dart';
import 'package:gym_tracker/ui/common/ui_helpers.dart';
import 'package:gym_tracker/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'issue_reported_dialog_model.dart';

const double _graphicSize = 60;

class IssueReportedDialog extends StackedView<IssueReportedDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const IssueReportedDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    IssueReportedDialogModel viewModel,
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
                    "Issue Reported",
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
                    "Thank you for reporting this issue. Our maintenance team has been notified.",
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
                    buttonText: "Return to Equipment Details",
                    onPressed: viewModel.goToEquipmentDetails,
                  )
                ],
              ),
            ]))
    );
  }

  @override
  IssueReportedDialogModel viewModelBuilder(BuildContext context) =>
      IssueReportedDialogModel();
}
