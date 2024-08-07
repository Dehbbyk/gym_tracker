import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'logged_workout_viewmodel.dart';

class LoggedWorkoutView extends StackedView<LoggedWorkoutViewModel> {
  const LoggedWorkoutView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoggedWorkoutViewModel viewModel,
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
        title: const Center(
          child: Text(
            'Logged Workout',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
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
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Preview your logged workout',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Table(
              columnWidths: const {
                0: FlexColumnWidth(3),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(2),
                3: FlexColumnWidth(1),
              },
              children: const [
                TableRow(
                  children: [
                    Row(
                      children: [
                        Text('Type',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500)),
                        SizedBox(width: 5),
                        Icon(Icons.help_outline_outlined, size: 16),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.timer_sharp, size: 16),
                        SizedBox(width: 5),
                        Text('Set',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.calendar_month, size: 16),
                        SizedBox(width: 5),
                        Text('Date',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    Text('More',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.workoutLogs.length,
                itemBuilder: (context, index) {
                  final log = viewModel.workoutLogs[index];
                  return Table(
                    columnWidths: const {
                      0: FlexColumnWidth(3),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(2),
                      3: FlexColumnWidth(1),
                    },
                    children: [
                      TableRow(
                        children: [
                          Text(log.type),
                          Text(log.sets.toString()),
                          Text(log.date.toLocal().toString().split(' ')[0]),
                          PopupMenuButton<String>(
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
                        ],
                      ),
                    ],
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
  LoggedWorkoutViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoggedWorkoutViewModel();
}
