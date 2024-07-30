import 'package:gym_tracker/core/models/maintenance_model.dart';
import 'package:stacked/stacked.dart';

class MaintenanceViewModel extends ReactiveViewModel {
  final List<MaintenanceData> maintenances = [
    MaintenanceData(
      imageUrl: "1",
      equipmentName: "Treadmill",
      categoryName: "Cardio",
      lastMaintenance: DateTime.now(),
      nextMaintenance: DateTime.now().add(const Duration(days: 3)),
      status: MaintenanceStatus.available,
    ),
    MaintenanceData(
      imageUrl: "2",
      equipmentName: "Stationary Bike",
      categoryName: "Muscle",
      lastMaintenance: DateTime.now().subtract(const Duration(days: 2)),
      nextMaintenance: DateTime.now(),
      status: MaintenanceStatus.maintenanceMode,
    ),
    MaintenanceData(
      imageUrl: "3",
      equipmentName: "Elliptical Trainer",
      categoryName: "Abs",
      lastMaintenance: DateTime.now().subtract(const Duration(days: 9)),
      nextMaintenance: DateTime.now().add(const Duration(days: 5)),
      status: MaintenanceStatus.available,
    ),
    MaintenanceData(
      imageUrl: "4",
      equipmentName: "Leg Press",
      categoryName: "Strength",
      lastMaintenance: DateTime.now().subtract(const Duration(days: 60)),
      nextMaintenance: DateTime.now().add(const Duration(days: 90)),
      status: MaintenanceStatus.unavailable,
    ),
    MaintenanceData(
      imageUrl: "5",
      equipmentName: "Lat Pulldown",
      categoryName: "Strength",
      lastMaintenance: DateTime.now().subtract(const Duration(days: 30)),
      nextMaintenance: DateTime.now().add(const Duration(days: 60)),
      status: MaintenanceStatus.unavailable,
    ),
    MaintenanceData(
      imageUrl: "2",
      equipmentName: "Roller",
      categoryName: "Muscle",
      lastMaintenance: DateTime.now().subtract(const Duration(days: 5)),
      nextMaintenance: DateTime.now(),
      status: MaintenanceStatus.maintenanceMode,
    ),
  ];
}
