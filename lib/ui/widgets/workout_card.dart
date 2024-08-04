import 'package:flutter/material.dart';
import 'package:gym_tracker/core/models/log_workout_model.dart';

class WorkoutCard extends StatelessWidget {
  final LogWorkoutModel logWorkOutModel;
  final Function onView;
  const WorkoutCard(
      {super.key, required this.logWorkOutModel, required this.onView});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SizedBox(
          height: 100,
          width: 100,
          child: Image(
            image: AssetImage(
                'assets/images/equip_image_${switch (logWorkOutModel.typeOfExercise) {
              "Running" => "1",
              "Swimming" => "2",
              "Cycling" => "3",
              "Weightlifting" => "4",
              "Bench Press" => "2",
              "Treadmill Run" => "4",
              "Squats" => "1",
              _ => "5"
            }}.png'),
          ),
        ),
        title: Text(
          logWorkOutModel.typeOfExercise,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${logWorkOutModel.date.toLocal()}'.split(' ')[0],
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            Row(
              children: [
                const Icon(Icons.countertops_outlined, size: 16),
                const SizedBox(width: 5),
                Expanded(
                  child: Text('${logWorkOutModel.set} sets'),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.timer_outlined, size: 16),
                const SizedBox(width: 5),
                Expanded(
                  child: FittedBox(
                      child: Text('${logWorkOutModel.duration} mins')),
                ),
              ],
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == "View") {
              onView();
            }
            // Handle menu actions here
          },
          itemBuilder: (BuildContext context) {
            return {'View'}.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ),
    );
  }
}
