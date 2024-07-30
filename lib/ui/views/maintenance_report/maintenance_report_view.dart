import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'maintenance_report_viewmodel.dart';

class MaintenanceReportView extends StackedView<MaintenanceReportViewModel> {
  const MaintenanceReportView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MaintenanceReportViewModel viewModel,
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
  MaintenanceReportViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MaintenanceReportViewModel();
}
