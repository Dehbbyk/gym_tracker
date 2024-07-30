import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_tracker/ui/common/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stacked/stacked.dart';

// import 'equipment_detail_viewmodel.dart';
import 'maintenance_report_viewmodel.dart';

class MaintenanceReportView extends StackedView<MaintenanceReportViewModel> {
  const MaintenanceReportView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context,
      MaintenanceReportViewModel viewModel,
      Widget? child,
      ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
          "Equipment Details",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 221,
                width: double.infinity,
                child: Stack(
                  children: [
                    CarouselSlider(
                      unlimitedMode: true,
                      scrollDirection: Axis.horizontal,
                      onSlideChanged: viewModel.changeNote,
                      slideTransform: const ZoomOutSlideTransform(),
                      children: List.generate(
                        viewModel.onboardingNotes.length,
                            (index) => Image.asset(
                          viewModel.onboardingNotes[index],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: AnimatedSmoothIndicator(
                          count: viewModel.onboardingNotes.length,
                          activeIndex: viewModel.noteIndex,
                          effect: const ExpandingDotsEffect(
                            spacing: 4,
                            activeDotColor: kcPrimaryColor,
                            dotWidth: 5,
                            dotHeight: 5,
                            expansionFactor: 6,
                            dotColor: Colors.white,
                          ),
                          // onDotClicked: (index) => viewModel.changeNote(index),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Treadmill Adult Tool",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  const Text("Cardio",
                      style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: kcSuccessTint,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      "Available",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: kcSuccess),
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Text("4.5",
                      style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                ],
              ),
              const SizedBox(height: 14),
              const ExpansionTileWidget(
                title: "Maintenance Report",
                content: [
                  Text(
                      "A treadmill is a stationary exercise machine that allows users to walk, jog, or run indoors. It consists of a moving platform with a wide conveyor belt driven by an electric motor or flywheel. The speed and incline of the treadmill can be adjusted to simulate different walking or running conditions. Most treadmills come equipped with a display panel that shows key workout metrics such as speed, distance, time, and calories burned. Some advanced models also offer built-in workout programs, heart rate monitoring, and entertainment features like music or video screens.")
                ],
              ),
              const ExpansionTileWidget(
                title: "Last Maintenance Date",
                content: [Text("17th July, 2024")],
              ),
              const ExpansionTileWidget(
                title: "Next Maintenance Date",
                content: [Text("October 17th, 2024")],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Status"),
                  const Spacer(),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: kcSuccessTint,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      "Maintained",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: kcSuccess),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => viewModel.reportIssuesNavigation(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kcPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.5, vertical: 8),
                      elevation: 0),
                  child: const Text(
                    "View Maintenance History",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => viewModel.maintenanceReportNavigation(),
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
                    "Report Issues",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: kcTextColor1),
                  ),
                ),
              ),
              const SizedBox(height: 37),
            ],
          ),
        ),
      ),
    );
  }

  @override
  MaintenanceReportViewModel viewModelBuilder(
      BuildContext context,
      ) =>
      MaintenanceReportViewModel();
}

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({
    super.key,
    required this.content,
    required this.title,
  });
  final String title;
  final List<Widget> content;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        dense: true,
        initiallyExpanded: true,
        tilePadding: EdgeInsets.zero,
        childrenPadding: EdgeInsets.zero,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        expandedAlignment: Alignment.centerLeft,
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        children: content,
      ),
    );
  }
}