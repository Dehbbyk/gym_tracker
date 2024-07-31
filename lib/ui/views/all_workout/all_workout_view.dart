import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_tracker/ui/common/app_colors.dart';
import 'package:gym_tracker/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/workout_card.dart';
import 'all_workout_viewmodel.dart';

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
          surfaceTintColor: Theme.of(context).colorScheme.background,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: GestureDetector(
              onTap: () => viewModel.goBack(),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/arrow_left.svg",
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
          centerTitle: true,
          title: const Text(
            "Saved Workout",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: viewModel.workOutLogs.isEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image:
                            AssetImage("assets/images/workout_empty_img.png"),
                        height: 150,
                        width: 150,
                      ),
                      const Text(
                        "No Workout Logged",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: kcTextColor1),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "You currently do not have any workout. Click on the button bellow to register a workout",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: kcTextColor2),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      CustomButton(
                        buttonText: "Log Workout",
                        onPressed: viewModel.logWorkout,
                      )
                    ],
                  )
                : ListView.builder(
                    itemCount: viewModel.workOutLogs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final workout = viewModel.workOutLogs[index];
                      return GestureDetector(
                        onTap: () =>
                            viewModel.workOutDetailsNavigation(workout),
                        child: WorkoutCard(
                          logWorkOutModel: workout,
                          onView: () =>
                              viewModel.workOutDetailsNavigation(workout),
                        ),
                      );
                    }),
          ),
        ),

      floatingActionButton:
      viewModel.workOutLogs.isEmpty ?
      Container():
      FloatingActionButton(
        onPressed: viewModel.logWorkout,
      ),
    );
  }

  @override
  AllWorkoutViewModel viewModelBuilder(BuildContext context) =>
      AllWorkoutViewModel();
}
