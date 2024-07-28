import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'log_workout_viewmodel.dart';

class LogWorkoutView extends StackedView<LogWorkoutViewModel> {
  const LogWorkoutView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LogWorkoutViewModel viewModel,
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
  LogWorkoutViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LogWorkoutViewModel();
}
