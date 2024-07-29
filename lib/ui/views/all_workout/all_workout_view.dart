import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'all_workout_viewmodel.dart';

class AllWorkoutView extends StackedView<AllWorkoutViewModel> {
  const AllWorkoutView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AllWorkoutViewModel viewModel,
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
  AllWorkoutViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AllWorkoutViewModel();
}
