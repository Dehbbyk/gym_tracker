import 'package:gym_tracker/app/app.logger.dart';
import 'package:gym_tracker/core/models/log_workout_model.dart';
import 'package:stacked/stacked.dart';

class LogWorkoutService with ListenableServiceMixin {
  LogWorkoutModel? _selectedWorkout;
  final List<LogWorkoutModel> _logWorkouts = [];
  final logger = getLogger("LogWorkoutService");

  void saveLogWorkout(LogWorkoutModel logWorkout) {
    _logWorkouts.add(logWorkout);
    logger.d(_logWorkouts.map((log) => log.toString()).toList());
    notifyListeners();
  }

  List<LogWorkoutModel> get logWorkouts => _logWorkouts;

  LogWorkoutModel? get selectedWorkout => _selectedWorkout;

  void setSelectedWorkout(LogWorkoutModel workout) {
    _selectedWorkout = workout;
    notifyListeners();
  }

  void deleteWorkout(LogWorkoutModel workout) {
    _logWorkouts.remove(workout);
    logger.d("Deleted workout: ${workout.toString()}");
    notifyListeners();
  }
}
