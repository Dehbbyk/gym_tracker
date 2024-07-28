import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'logged_workout_viewmodel.dart';

class LoggedWorkoutView extends StackedView<LoggedWorkoutViewModel> {
  const LoggedWorkoutView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoggedWorkoutViewModel viewModel,
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
  LoggedWorkoutViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoggedWorkoutViewModel();
}
