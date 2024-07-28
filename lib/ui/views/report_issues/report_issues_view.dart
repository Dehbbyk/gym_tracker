import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'report_issues_viewmodel.dart';

class ReportIssuesView extends StackedView<ReportIssuesViewModel> {
  const ReportIssuesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ReportIssuesViewModel viewModel,
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
  ReportIssuesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ReportIssuesViewModel();
}
