import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Barbell.svg',
            ),
            label: 'Workout',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Scan.svg',
            ),
            label: 'Scan NFC',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/ChartLineUp.svg',
            ),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/ClockCounterClockwise.svg',
            ),
            label: 'History',
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
