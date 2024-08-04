import 'package:flutter/material.dart';
import 'package:gym_tracker/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'workout_details_viewmodel.dart';

class WorkoutDetailsView extends StackedView<WorkoutDetailsViewModel> {
  const WorkoutDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WorkoutDetailsViewModel viewModel,
    Widget? child,
  ) {
    if (viewModel.loggedWorkOutDetails == null) {
      return const Center(child: Text("No workout details available"));
    }
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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(
                  'assets/images/equip_image_${switch (viewModel.loggedWorkOutDetails?.typeOfExercise) {
                "Running" => "1",
                "Swimming" => "2",
                "Cycling" => "3",
                "Weightlifting" => "4",
                "Bench Press" => "2",
                "Treadmill Run" => "4",
                "Squats" => "1",
                _ => "5"
              }}.png'),
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              viewModel.loggedWorkOutDetails!.typeOfExercise,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '${viewModel.loggedWorkOutDetails?.date.toLocal()}'.split(' ')[0],
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.fitness_center, size: 20),
                const SizedBox(width: 5),
                Text(
                  'Set: ${viewModel.loggedWorkOutDetails?.set}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 20),
                const Icon(Icons.timer, size: 20),
                const SizedBox(width: 5),
                Text(
                  '${viewModel.loggedWorkOutDetails?.duration} ',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 20),
                const Icon(Icons.repeat, size: 20),
                const SizedBox(width: 5),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: viewModel.showDialog,
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
            SizedBox(
              height: 40,
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => viewModel.editWorkout(),
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: kcVeryLightGrey,
                    ),
                    // backgroundColor: kcPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.5, vertical: 8),
                    elevation: 0),
                child: const Text(
                  "Edit Workout",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: kcTextColor1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  WorkoutDetailsViewModel viewModelBuilder(BuildContext context) =>
      WorkoutDetailsViewModel();
}
