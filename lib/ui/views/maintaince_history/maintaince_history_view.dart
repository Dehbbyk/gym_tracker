import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'maintaince_history_viewmodel.dart';

class MaintainceHistoryView extends StackedView<MaintainceHistoryViewModel> {
  const MaintainceHistoryView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MaintainceHistoryViewModel viewModel,
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
  MaintainceHistoryViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MaintainceHistoryViewModel();
}
