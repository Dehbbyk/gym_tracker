import 'package:flutter/material.dart';
import 'package:gym_tracker/core/models/log_workout_model.dart';

class WorkoutCard extends StatelessWidget {
  final LogWorkoutModel logWorkOutModel;
  const WorkoutCard({super.key, required this.logWorkOutModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: const Image(
          image: AssetImage('assets/images/empty_img_placeholders.jpg'),
          height: 100,
          width: 100,
        ),
        title: Text(
          logWorkOutModel.typeOfExercise,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${logWorkOutModel.date.toLocal()}'.split(' ')[0]),
            Row(
              children: [
                const Icon(Icons.timer, size: 16),
                const SizedBox(width: 5),
                Text(
                    '${logWorkOutModel.set} sets, ${logWorkOutModel.duration} mins'),
              ],
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            // Handle menu actions here
          },
          itemBuilder: (BuildContext context) {
            return {'View', 'Download'}.map((String choice) {
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
