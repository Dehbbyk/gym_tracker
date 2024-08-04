import 'package:flutter/material.dart';
import 'package:gym_tracker/services/nfc_service.dart';
import 'package:gym_tracker/ui/widgets/custom_button.dart';
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
      appBar: AppBar(
        title: const Text("Scanning NFC"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("assets/images/nfc_anime.gif"),
                height: 230,
                width: 230,
              ),
              if (viewModel.isProcessing) CircularProgressIndicator(),
              const Text(
                "Hold the Phone’s NFC Area close to the Tag",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                "The NFC area is generally found near the camera on the back of the phone",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              CustomButton(
                buttonText: "Scan",
                onPressed: () =>
                    viewModel.startNFCOperation(NFCOperation.read, null),
              ),
              CustomButton(
                buttonText: "Write",
                onPressed: () =>
                    viewModel.startNFCOperation(NFCOperation.write, jsonData),
              ),
              if (viewModel.message.isNotEmpty && !viewModel.isProcessing)
                Column(
                  children: [
                    Text(
                      viewModel.message == "DONE"
                          ? "Successfully Written"
                          : viewModel.message,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    if (viewModel.message == "DONE")
                      const Text(
                        "Your exercise equipment data has been written successfully.",
                        textAlign: TextAlign.center,
                      ),
                    if (viewModel.readJsonData.isNotEmpty)
                      CustomButton(
                        buttonText: "View Equipment Details",
                        onPressed:
                          viewModel.equipmentDetailsNavigation // Navigate to equipment details view
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  NfcViewModel viewModelBuilder(BuildContext context) => NfcViewModel();
}
