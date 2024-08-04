import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_tracker/ui/common/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stacked/stacked.dart';

import 'equipment_detail_viewmodel.dart';

class EquipmentDetailView extends StackedView<EquipmentDetailViewModel> {
  const EquipmentDetailView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EquipmentDetailViewModel viewModel,
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
              Row(
                children: [
                  Text(
                    viewModel.equipmentData["equipment"]['name'],
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 33,
                    child: ElevatedButton(
                      onPressed: viewModel.navigateToLogWorkOut,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kcPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.5, vertical: 4),
                          elevation: 0),
                      child: const Text(
                        "Log workout",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              ExpansionTileWidget(
                title: "Description of Equipment",
                content: [
                  Text(viewModel.equipmentData["equipment"]['description'])
                ],
              ),
              const SizedBox(height: 14),
              ExpansionTileWidget(
                title: "Usage Instructions",
                content: viewModel.equipmentData['instructions'].entries
                    .map<Widget>((entry) => Text("• ${entry.value}"))
                    .toList(),
              ),
              const SizedBox(height: 14),
              ExpansionTileWidget(
                title: "Safety Tips",
                content: viewModel.equipmentData['safetyTips'].entries
                    .map<Widget>((entry) => Text("• ${entry.value}"))
                    .toList(),
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
                    "Report Issues",
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
                    "View Maintenance Reports",
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
  EquipmentDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EquipmentDetailViewModel();
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
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        children: content,
      ),
    );
  }
}
