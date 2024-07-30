import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LogWorkoutViewModel extends BaseViewModel {
  String _duration = '';
  String _typeOfExercise = '';
  String _weight = '';
  String _repetition = '';

  String get duration => _duration;
  String get typeOfExercise => _typeOfExercise;
  String get weight => _weight;
  String get repetition => _repetition;

  void setDuration(String value) {
    _duration = value;
    notifyListeners();
  }

  void setTypeOfExercise(String value) {
    _typeOfExercise = value;
    notifyListeners();
  }

  void setWeight(String value) {
    _weight = value;
    notifyListeners();
  }

  void setRepetition(String value) {
    _repetition = value;
    notifyListeners();
  }

  void saveWorkout() {
    // Save the workout data logic
  }
}
