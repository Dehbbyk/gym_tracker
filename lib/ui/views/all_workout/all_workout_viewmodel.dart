import 'package:stacked/stacked.dart';

class WorkoutLog {
  final String type;
  final int sets;
  final DateTime date;
  final int duration;
  final String image;

  WorkoutLog({required this.type, required this.sets, required this.date, required this.duration, required this.image});
}

class AllWorkoutViewModel extends BaseViewModel {
  List<WorkoutLog> _workoutLogs = [
    WorkoutLog(type: 'Bench Press', sets: 4, date: DateTime(2024, 7, 26), duration: 30, image: 'bench_press.png'),
    WorkoutLog(type: 'Treadmill Run', sets: 1, date: DateTime(2024, 7, 24), duration: 45, image: 'treadmill_run.png'),
    WorkoutLog(type: 'Squats', sets: 6, date: DateTime(2024, 7, 22), duration: 40, image: 'squats.png'),
    WorkoutLog(type: 'Lat Pulldown', sets: 3, date: DateTime(2024, 7, 20), duration: 25, image: 'lat_pulldown.png'),
  ];

  List<WorkoutLog> get workoutLogs => _workoutLogs;

  void searchWorkouts(String query) {
    // Implement search functionality
  }
}