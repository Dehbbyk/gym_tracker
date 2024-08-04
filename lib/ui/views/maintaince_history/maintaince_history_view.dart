import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_tracker/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

import 'maintaince_history_viewmodel.dart';

class MaintainceHistoryView extends StackedView<MaintainceHistoryViewModel> {
  const MaintainceHistoryView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MaintainceHistoryViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_sharp,
              size: 24.0,
              weight: 1.5,
              color: Color(0xff0A0A0A),
            ),
          ),
        ),
        title: Text(
          'Maintenance History',
          style: GoogleFonts.inter(
            fontStyle: FontStyle.normal,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color(0xff0A0A0A),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: const Icon(
                Icons.notifications_none_sharp,
                size: 24,
                color: Color(0xff525252),
                weight: 1.5,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: 363,
              height: 435,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: const Border(
                    top: BorderSide(width: 1.0, color: Color(0xffCBD5E1)),
                    bottom: BorderSide(width: 1.0, color: Color(0xffCBD5E1)),
                    right: BorderSide(width: 1.0, color: Color(0xffCBD5E1)),
                    left: BorderSide(width: 1.0, color: Color(0xffCBD5E1)),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Past Maintenance',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff525252),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Date',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff525252),
                      ),
                    ),
                    const SizedBox(height: 1.0),
                    Text(
                      '7/15/2024',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff525252),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Type',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff525252),
                      ),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Text(
                      'Repair',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff525252),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Notes',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff525252),
                      ),
                    ),
                    const SizedBox(height: 1.0),
                    Text(
                      'Replaced worn-out pulley',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff525252),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Status',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff525252),
                      ),
                    ),
                    const SizedBox(height: 1.0),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffECFDF3),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 1.5),
                        child: Text(
                          'Available',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff6DC347),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Date',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff525252),
                      ),
                    ),
                    const SizedBox(height: 1.0),
                    Text(
                      '05/10/2024',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff525252),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Type',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff525252),
                      ),
                    ),
                    const SizedBox(height: 1.0),
                    Text(
                      'Cleaning',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff525252),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Notes',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff525252),
                      ),
                    ),
                    const SizedBox(height: 1.0),
                    Text(
                      'Full cleaning and lubrication of moving parts',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff525252),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Status',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff525252),
                      ),
                    ),
                    const SizedBox(height: 1.0),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffECFDF3),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 1.5),
                        child: Text(
                          'Available',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff6DC347),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: 363,
              height: 95,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: const Border(
                    top: BorderSide(width: 1.0, color: Color(0xffCBD5E1)),
                    bottom: BorderSide(width: 1.0, color: Color(0xffCBD5E1)),
                    right: BorderSide(width: 1.0, color: Color(0xffCBD5E1)),
                    left: BorderSide(width: 1.0, color: Color(0xffCBD5E1)),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Next Scheduled Maintenance',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff525252),
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      '08/01/2024',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff525252),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffF2F4F7),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 1.5),
                        child: Text(
                          'Upcoming in 5 days',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff525252),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 30.0, right: 20),
              color: Colors.transparent,
              child: Row(
                children: [
                  Text(
                    'Receive updates about this equipment',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff0A0A0A),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      color: const Color(0xffF97316),
                      padding: EdgeInsets.zero,
                      iconSize: 47,
                      onPressed: () {},
                      icon: const Icon(Icons.toggle_on_sharp))
                ],
              ),
            ),
             CustomButton(buttonText: "Return to Equipment", onPressed: viewModel.navigateToEquipment,)
          ],
        ),
      ),
    );
  }

  @override
  MaintainceHistoryViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MaintainceHistoryViewModel();
}
