import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'maintenance_viewmodel.dart';

class MaintenanceView extends StackedView<MaintenanceViewModel> {
  const MaintenanceView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MaintenanceViewModel viewModel,
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
  MaintenanceViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MaintenanceViewModel();
}
