import 'package:gym_tracker/app/app.logger.dart';
import 'package:gym_tracker/core/models/log_workout_model.dart';
import 'package:stacked/stacked.dart';

class LogWorkoutService with ListenableServiceMixin {
  LogWorkoutModel? _selectedWorkout;
  final List<LogWorkoutModel> _logWorkouts = [];
  final logger = getLogger("LogWorkoutService");

  void saveLogWorkout(LogWorkoutModel logWorkout) {
    if (_selectedWorkout != null) {
      // Update existing workout
      int index = _logWorkouts.indexOf(_selectedWorkout!);
      _logWorkouts[index] = logWorkout;
    } else {
      // Add new workout
      _logWorkouts.add(logWorkout);
    }
    logger.d(_logWorkouts.map((log) => log.toString()).toList());
    _selectedWorkout = null; // Clear selected workout after saving
    notifyListeners();
  }

  List<LogWorkoutModel> get logWorkouts => _logWorkouts;

  LogWorkoutModel? get selectedWorkout => _selectedWorkout;

  void setSelectedWorkout(LogWorkoutModel workout) {
    _selectedWorkout = workout;
    notifyListeners();
  }

  LogWorkoutModel? getSelectedWorkout() {
    return _selectedWorkout;
  }

  void deleteWorkout(LogWorkoutModel workout) {
    _logWorkouts.remove(workout);
    logger.d("Deleted workout: ${workout.toString()}");
    notifyListeners();
  }
}
