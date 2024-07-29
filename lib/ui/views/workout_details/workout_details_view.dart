import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'workout_details_viewmodel.dart';

class WorkoutDetailsView extends StackedView<WorkoutDetailsViewModel> {
  const WorkoutDetailsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WorkoutDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  WorkoutDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WorkoutDetailsViewModel();
}
