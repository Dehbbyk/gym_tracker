import 'package:stacked/stacked.dart';

class LogWorkoutViewModel extends BaseViewModel {
  String? _duration;
  String? _typeOfExercise;
  String? _size;
  String? _repetition;

  // Getters
  String? get duration => _duration;
  String? get typeOfExercise => _typeOfExercise;
  String? get size => _size;
  String? get repetition => _repetition;

  // Setters
  void setDuration(String value) {
    _duration = value;
    notifyListeners();
  }

  void setTypeOfExercise(String value) {
    _typeOfExercise = value;
    notifyListeners();
  }

  void setSize(String value) {
    _size = value;
    notifyListeners();
  }

  void setDate(String value) {
    _repetition = value;
    notifyListeners();
  }

  // Validation method
  bool validateInputs() {
    return _duration != null && _duration!.isNotEmpty &&
        _typeOfExercise != null && _typeOfExercise!.isNotEmpty &&
        _size != null && _size!.isNotEmpty &&
        _repetition != null && _repetition!.isNotEmpty;
  }

  // Method to save the workout data
  void saveWorkout() {
    if (validateInputs()) {
      // Logic to save workout, e.g., sending data to a backend or local storage
      print('Workout saved: Duration - $_duration, Type of Exercise - $_typeOfExercise, Size - $_size, Repetition - $_repetition');
    } else {
      print('Invalid input');
    }
  }
}
