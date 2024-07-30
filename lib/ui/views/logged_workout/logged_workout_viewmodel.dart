import 'package:stacked/stacked.dart';

class WorkoutLog {
  final String type;
  final int sets;
  final DateTime date;

  WorkoutLog({required this.type, required this.sets, required this.date});
}

class LoggedWorkoutViewModel extends BaseViewModel {
  List<WorkoutLog> _workoutLogs = [
    WorkoutLog(type: 'Bench Press', sets: 4, date: DateTime(26, 6, 2024)),
    WorkoutLog(type: 'Treadmill Run', sets: 1, date: DateTime(26, 6, 2024)),
    WorkoutLog(type: 'Squats', sets: 6, date: DateTime(26, 6, 2024)),
    WorkoutLog(type: 'Lat Pulldown', sets: 3, date: DateTime(26, 6, 2024)),
  ];

  List<WorkoutLog> _filteredLogs = [];

  List<WorkoutLog> get workoutLogs =>
      _filteredLogs.isEmpty ? _workoutLogs : _filteredLogs;

  void searchWorkouts(String query) {
    _filteredLogs = _workoutLogs
        .where((log) => log.type.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void filterByDate(DateTime selectedDate) {
    _filteredLogs = _workoutLogs
        .where((log) => log.date.isAtSameMomentAs(selectedDate))
        .toList();
    notifyListeners();
  }
}
