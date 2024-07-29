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
      body: SingleChildScrollView(
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
                hintText: 'Enter the duration',
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
                hintText: 'Enter the type of workout',
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: viewModel.setTypeOfExercise,
            ),
            SizedBox(height: 10),
            Text(
              'Set',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter the set',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: viewModel.setSize,
            ),
            SizedBox(height: 10),
            Text(
              'Date',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter the date',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: viewModel.setRepetition,
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                onPressed: viewModel.saveWorkout,
                child: Text(
                  'Save Workout',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 6),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                onPressed: viewModel.writeToNfcTag,
                child: Text(
                  'Save to NFC Tag',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            if (viewModel.nfcStatus.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  viewModel.nfcStatus,
                  style: TextStyle(color: Colors.red),
                ),
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
