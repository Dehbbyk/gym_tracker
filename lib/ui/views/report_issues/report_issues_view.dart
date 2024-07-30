import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gym_tracker/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'report_issues_viewmodel.dart';

class ReportIssuesView extends StackedView<ReportIssuesViewModel> {
  const ReportIssuesView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, ReportIssuesViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Report Issues',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: kcTextColor1,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Report Equipment',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Fill the form below to state further reason for reporting or simply confirm report.',
              ),
              const SizedBox(height: 24),
              const Text(
                'Comment',
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'typing.......',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                    const BorderSide(width: 0.5, color: kcPrimaryColor),
                  ),
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Wish to upload an image?'),
                  Switch(
                    value: viewModel.uploadImage,
                    activeTrackColor: kcPrimaryColor,
                    inactiveTrackColor: kcPrimaryColor.withOpacity(0.5),
                    inactiveThumbColor: Colors.white,
                    onChanged: (value) {
                      viewModel.toggleUploadImage();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (viewModel.uploadImage)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Upload Image",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: viewModel.pickImage,
                      child: Container(
                        width: 342,
                        height: 148,
                        decoration: BoxDecoration(
                          border: Border.all(color: kcPrimaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: viewModel.selectedImage != null
                            ? Image.file(
                          File(viewModel.selectedImage!.path),
                          fit: BoxFit.cover,
                        )
                            : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/upload_icon.png"),
                            const Wrap(
                              children: [
                                Text(
                                  'Drag and drop or ',
                                  style: TextStyle(
                                      fontSize: 14, color: kcTextColor2),
                                ),
                                Text(
                                  "Browse",
                                  style: TextStyle(color: kcPrimaryColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Supports JPEG, PNG, PDF',
                      style: TextStyle(
                          color: kcNeutralDark1,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              const SizedBox(height: 16),
              Center(
                child: GestureDetector(
                  onTap: viewModel.showDialog,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: kcPrimaryColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Center(
                      child: Text(
                        "Confirm Report",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  @override
  ReportIssuesViewModel viewModelBuilder(BuildContext context) =>
      ReportIssuesViewModel();
}
