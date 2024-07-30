import 'package:flutter/material.dart';

import 'package:gym_tracker/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_viewmodel.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: IndexedStack(
        index: viewModel.selectedIndex,
        children: viewModel.widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Details',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner),
            label: 'Scan NFC',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center_rounded),
            label: 'Equipment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run),
            label: 'Workout',
          ),
        ],
        selectedItemColor: kcPrimaryColor,
        showUnselectedLabels: true,
        unselectedItemColor: const Color(0xff85858B),
        unselectedLabelStyle: const TextStyle(color: Color(0xff85858B)),
        onTap: viewModel.onItemTapped,
        currentIndex: viewModel.selectedIndex,
      ),
    );
  }

  @override
  DashboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DashboardViewModel();
}
