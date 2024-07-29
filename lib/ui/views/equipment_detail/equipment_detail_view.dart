import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'equipment_detail_viewmodel.dart';

class EquipmentDetailView extends StackedView<EquipmentDetailViewModel> {
  const EquipmentDetailView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EquipmentDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: const Text("Equipment Detail View"),
        ),
      ),
    );
  }

  @override
  EquipmentDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EquipmentDetailViewModel();
}
