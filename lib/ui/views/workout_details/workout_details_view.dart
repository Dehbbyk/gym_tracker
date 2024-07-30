import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'workout_details_viewmodel.dart';

class WorkoutDetailsView extends StackedView<WorkoutDetailsViewModel> {
  final Workout workout;

  const WorkoutDetailsView({Key? key, required this.workout}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WorkoutDetailsViewModel viewModel,
    Widget? child,
  ) {
    // if (workout == null) {
    //   return Center(child: Text("No workout details available"));
    // }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Center(
          child: Text(
            'Logged Workout',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/icons/images/${workout.image}',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              workout.type,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '${workout.date.toLocal()}'.split(' ')[0],
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.fitness_center, size: 20),
                const SizedBox(width: 5),
                Text(
                  'Set: ${workout.sets}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 20),
                const Icon(Icons.timer, size: 20),
                const SizedBox(width: 5),
                Text(
                  '${workout.duration} mins',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 20),
                const Icon(Icons.repeat, size: 20),
                const SizedBox(width: 5),
                Text(
                  'Reps: ${workout.reps}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => viewModel.deleteWorkout(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Background color
                ),
                child: const Text(
                  'Delete Workout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: viewModel.editWorkout,
              child: const Text('Edit Workout'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  WorkoutDetailsViewModel viewModelBuilder(BuildContext context) =>
      WorkoutDetailsViewModel(workout: workout);
}
