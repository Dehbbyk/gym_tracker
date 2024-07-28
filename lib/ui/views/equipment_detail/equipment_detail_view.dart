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
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  EquipmentDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EquipmentDetailViewModel();
}
