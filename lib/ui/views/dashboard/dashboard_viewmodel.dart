import 'package:flutter/material.dart';
import 'package:gym_tracker/app/app.locator.dart';
import 'package:gym_tracker/services/app_service.dart';
import 'package:gym_tracker/ui/views/equipment_detail/equipment_detail_view.dart';
import 'package:gym_tracker/ui/views/home/home_view.dart';
import 'package:gym_tracker/ui/views/logged_workout/logged_workout_view.dart';
import 'package:gym_tracker/ui/views/nfc/nfc_view.dart';
import 'package:stacked/stacked.dart';

class DashboardViewModel extends ReactiveViewModel {
  final AppService _appService = locator<AppService>();
  final List<Widget> widgetOptions = <Widget>[
    const EquipmentDetailView(),
    const NfcView(),
    Container(
      color: Colors.blue,
      child: const Center(child: Text("Report flow")),
    ),
    Container(
      color: Colors.red,
      child: const Center(child: Text("Workoutflow")),
    ),
  ];

  int get selectedIndex => _appService.selectedIndex;
  void Function(int value) get onItemTapped => _appService.onItemTapped;

  @override
  // TODO: implement listenableServices
  List<ListenableServiceMixin> get listenableServices => [_appService];
}
