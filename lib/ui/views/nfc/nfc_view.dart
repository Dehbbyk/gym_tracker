import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_tracker/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'nfc_viewmodel.dart';

class NfcView extends StackedView<NfcViewModel> {
  const NfcView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NfcViewModel viewModel,
    Widget? child,
  ) {
    // Example JSON data to write to the NFC tag
    Map<String, String> jsonData = {
      "equipmentName": "Treadmill Adult Tool",
      "description": "A treadmill is a stationary exercise machine...",
      "exerciseInstructions":
          "Preparation: Ensure the treadmill is properly set up...",
      "safetyTips":
          "Safety Clip: Always attach the safety clip to your clothing...",
      "watchVideo": "a youtube gym link",
      "studySlide": "a blog or sth."
    };

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBodyBehindAppBar: true,
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
          "Scanning NFC",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 230,
              height: 230,
              child:
                  Image.asset("assets/images/nfc_anime.gif", fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            const Text(
              "Hold the Phone’s NFC Area close to the Tag",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: kcTextColor3,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "The NFC area is generally found near the camera on the back of the phone",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: kcTextColor3,
              ),
              textAlign: TextAlign.center,
            ),
            // const SizedBox(height: 24),
            // SizedBox(
            //   width: double.infinity,
            //   height: 40,
            //   child: ElevatedButton(
            //     onPressed: () => viewModel.equipmentDetailsNavigation(),
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: kcPrimaryColor,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(6),
            //         ),
            //         padding: const EdgeInsets.symmetric(
            //             horizontal: 16.5, vertical: 8),
            //         elevation: 0),
            //     child: const Text(
            //       "View Equipment Detail",
            //       style: TextStyle(
            //           fontSize: 14,
            //           fontWeight: FontWeight.w600,
            //           color: Colors.white),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  @override
  NfcViewModel viewModelBuilder(BuildContext context) => NfcViewModel();

  @override
  void onViewModelReady(NfcViewModel viewModel) {
    super.onViewModelReady(viewModel);
  }
//    onViewModelReady: (viewModel) {
//   viewModel.init();
// }
}
