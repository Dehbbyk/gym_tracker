import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'nfc_viewmodel.dart';

class NfcView extends StackedView<NfcViewModel> {
  const NfcView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NfcViewModel viewModel,
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
  NfcViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NfcViewModel();
}
