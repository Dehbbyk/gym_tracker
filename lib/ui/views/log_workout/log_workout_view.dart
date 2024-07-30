import 'package:flutter/material.dart';
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
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            'Log Workout',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none),
          )
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your Workout Details',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.grey),
            ),
            SizedBox(height: 20),
            Text(
              'Duration',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                hintText: 'Type here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: viewModel.setDuration,
            ),
            SizedBox(height: 10),
            Text(
              'Type of Exercise',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                hintText: 'Type here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: viewModel.setTypeOfExercise,
            ),
            SizedBox(height: 10),
            Text(
              'Weight',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                hintText: 'Type here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: viewModel.setWeight,
            ),
            SizedBox(height: 10),
            Text(
              'Repetition',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                hintText: 'Type here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: viewModel.setRepetition,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Save workout details
                    viewModel.saveWorkout();
                  },
                  child: Text('Save Workout'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Write to NFC tag
                    final workoutData = 'Duration: ${viewModel.duration}, '
                        'Type: ${viewModel.typeOfExercise}, '
                        'Weight: ${viewModel.weight}, '
                        'Repetitions: ${viewModel.repetition}';
                    viewModel.writeNfcTag(workoutData);
                  },
                  child: Text('Write to NFC'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Read from NFC tag
                    viewModel.readNfcTag();
                  },
                  child: Text('Read NFC'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  LogWorkoutViewModel viewModelBuilder(BuildContext context) =>
      LogWorkoutViewModel();
}
