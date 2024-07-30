import 'package:flutter/material.dart';
import 'package:gym_tracker/app/app.dialogs.dart';
import 'package:gym_tracker/app/app.locator.dart';
import 'package:gym_tracker/services/log_workout_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/models/log_workout_model.dart';

class LogWorkoutViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();

  final _dialogService = locator<DialogService>();
  final _logWorkOutService = locator<LogWorkoutService>();

  final TextEditingController durationController = TextEditingController();
  final TextEditingController typeOfExerciseController =
      TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController setController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  String? selectedExercise;
  List<String> exercises = [
    'Running',
    'Swimming',
    'Cycling',
    'Weightlifting',
    "Bench Press",
    "Treadmill Run",
    "Squats",
    "Lat Pulldown",
  ];

  void setDuration(String value) {
    // Handle duration value change
  }

  void setTypeOfExercise(String? value) {
    selectedExercise = value;
    notifyListeners();
  }

  void setWeight(String value) {
    // Handle weight value change
  }

  void setSet(String value) {
    // Handle set value change
  }

  void setDate(String value) {
    // Handle date value change
  }

  Future<void> pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      dateController.text = pickedDate.toIso8601String().split('T').first;
      notifyListeners();
    }
  }

  Future<void> pickDuration(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      durationController.text =
          '${pickedTime.hour} hours ${pickedTime.minute} minutes';
      notifyListeners();
    }
  }

  void saveWorkout() {
    final logWorkout = LogWorkoutModel(
      duration: durationController.text,
      typeOfExercise: selectedExercise!,
      weight: weightController.text,
      set: setController.text,
      date: DateTime.parse(dateController.text),
    );

    _logWorkOutService.saveLogWorkout(logWorkout);
    showDialog();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.logWorkoutSaved,
    );
  }

  @override
  void dispose() {
    durationController.dispose();
    typeOfExerciseController.dispose();
    weightController.dispose();
    setController.dispose();
    dateController.dispose();
    super.dispose();
  }
}
