import 'package:flutter/material.dart';
import 'package:gym_tracker/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';
import 'log_workout_viewmodel.dart';

class LogWorkoutView extends StackedView<LogWorkoutViewModel> {
  const LogWorkoutView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LogWorkoutViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Log Workout',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Enter your Workout Details',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              const CustomTextLabel(text: 'Duration'),
              const SizedBox(height: 6),
              CustomTextField(
                controller: viewModel.durationController,
                hintText: 'Type here',
                readOnly: true,
                onTap: () => viewModel.pickDuration(context),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the duration';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const CustomTextLabel(text: 'Type of Exercise'),
              const SizedBox(height: 6),
              DropdownButtonFormField<String>(
                value: viewModel.selectedExercise,
                borderRadius: BorderRadius.circular(8),
                hint: const Text('Select exercise'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffB6B6B6)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kcPrimaryColor, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                items: viewModel.exercises.map((String exercise) {
                  return DropdownMenuItem<String>(
                    value: exercise,
                    child: Text(exercise),
                  );
                }).toList(),
                onChanged: (value) {
                  viewModel.setTypeOfExercise(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select the type of exercise';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const CustomTextLabel(text: 'Set'),
              const SizedBox(height: 6),
              CustomTextField(
                controller: viewModel.setController,
                hintText: 'Type here',
                
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the set';
                  }
                  return null;
                },
                onChanged: viewModel.setSet,
              ),
              const SizedBox(height: 10),
              const CustomTextLabel(text: 'Date'),
              const SizedBox(height: 6),
              CustomTextField(
                controller: viewModel.dateController,
                hintText: 'Select date',
                readOnly: true,
                onTap: () => viewModel.pickDate(context),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select the date';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                buttonText: 'Save Workout',
                onPressed: viewModel.saveWorkout,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  LogWorkoutViewModel viewModelBuilder(BuildContext context) =>
      LogWorkoutViewModel();
}

class CustomTextLabel extends StatelessWidget {
  final String text;

  const CustomTextLabel({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
    );
  }
}

const Color kcPrimaryColor = Color(0xffF97316);

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final bool readOnly;
  final VoidCallback? onTap;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.onChanged,
    this.readOnly = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffB6B6B6)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kcPrimaryColor, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: validator,
      onChanged: onChanged,
      readOnly: readOnly,
      onTap: onTap,
    );
  }
}
