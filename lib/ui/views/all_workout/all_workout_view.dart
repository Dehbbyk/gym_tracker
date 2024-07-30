import 'package:flutter/material.dart';
import 'package:gym_tracker/ui/views/all_workout/all_workout_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AllWorkoutView extends StackedView<AllWorkoutViewModel> {
  const AllWorkoutView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context,
      AllWorkoutViewModel viewModel,
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
            'All Workout',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: viewModel.searchWorkouts,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Logged Workouts',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.workoutLogs.length,
                itemBuilder: (context, index) {
                  final log = viewModel.workoutLogs[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Image.asset('assets/icons/images/${log.image}'),
                      title: Text(
                        log.type,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${log.date.toLocal()}'.split(' ')[0]),
                          Row(
                            children: [
                              Icon(Icons.timer, size: 16),
                              SizedBox(width: 5),
                              Text('${log.sets} sets, ${log.duration} mins'),
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  AllWorkoutViewModel viewModelBuilder(
      BuildContext context,
      ) => AllWorkoutViewModel();
}
