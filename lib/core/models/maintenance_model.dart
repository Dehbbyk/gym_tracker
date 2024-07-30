enum MaintenanceStatus {
  available('Available'),
  unavailable('Do not use'),
  maintenanceMode('Under maintenance');

  const MaintenanceStatus(this.name);
  final String name;
}

class MaintenanceData {
  final String? imageUrl;
  final String? equipmentName;
  final String? categoryName;
  final DateTime? lastMaintenance;
  final DateTime? nextMaintenance;
  final MaintenanceStatus? status;

  MaintenanceData(
      {this.categoryName,
      this.equipmentName,
      this.imageUrl,
      this.lastMaintenance,
      this.nextMaintenance,
      this.status});
}
