import 'package:flutter/material.dart';
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
                      return WorkoutCard(
                        logWorkOutModel: viewModel.workOutLogs[index],
                      );
                    }),
          ),
        ));
  }

  @override
  AllWorkoutViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AllWorkoutViewModel();
}
