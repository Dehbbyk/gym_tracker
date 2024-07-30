import 'package:gym_tracker/app/app.logger.dart';
import 'package:gym_tracker/core/models/log_workout_model.dart';
import 'package:stacked/stacked.dart';

class LogWorkoutService with ListenableServiceMixin {
  final List<LogWorkoutModel> _logWorkouts = [];
  final logger = getLogger("LogWorkOutService");

  void saveLogWorkout(LogWorkoutModel logWorkout) {
    _logWorkouts.add(logWorkout);
    logger.i(_logWorkouts);
    notifyListeners();
  }

  List<LogWorkoutModel> get logWorkouts => List.unmodifiable(_logWorkouts);
}
