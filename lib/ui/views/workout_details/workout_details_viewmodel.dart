import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Workout {
  final String type;
  final int sets;
  final DateTime date;
  final int duration;
  final String image;
  final String reps;

  Workout({
    required this.type,
    required this.sets,
    required this.date,
    required this.duration,
    required this.image,
    required this.reps,
  });
}

class WorkoutDetailsViewModel extends BaseViewModel {
  final Workout workout;

  WorkoutDetailsViewModel({required this.workout});

  void deleteWorkout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Logged Workout'),
          content: Text('Are you sure you want to delete this logged workout? This action cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _confirmDelete(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Button color
              ),
              child: Text(
                  'Delete',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/icons/images/success.png', height: 100),
              Text(
                'Log workout deleted',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Text(
                'Well-done your logged workout has been deleted.',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Navigate to Workout History or other actions
                },
                child: Text('Return to New Log Workout'),
              ),
            ],
          )
        );
      },
    );
  }

  void editWorkout() {
    // Implement edit workout functionality
  }
}
