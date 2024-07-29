import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scanning NFC"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("assets/images/nfc_tag_img.png"),
                height: 230,
                width: 230,
              ),
              if (viewModel.isProcessing)
                const Image(
                  image: AssetImage("assets/images/nfc_tag_img.png"),
                  height: 230,
                  width: 230,
                ),
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
                //onPressed: viewModel.startNFCOperation,
              ),
              if (viewModel.message.isNotEmpty && !viewModel.isProcessing)
                Column(
                  children: [
                    Text(
                      viewModel.message == "DONE"
                          ? "Successfully Scanned"
                          : viewModel.message,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    if (viewModel.message == "DONE")
                      const Text(
                        "Your exercise equipment has been scanned successfully.",
                        textAlign: TextAlign.center,
                      ),
                    if (viewModel.message == "DONE")
                      const CustomButton(buttonText: "View Equipment Details"),
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
