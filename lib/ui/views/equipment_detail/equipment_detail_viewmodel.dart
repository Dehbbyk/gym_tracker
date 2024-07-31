import 'package:gym_tracker/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

import 'package:gym_tracker/app/app.locator.dart';
import 'package:gym_tracker/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EquipmentDetailViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  int noteIndex = 0;

  List<String> onboardingNotes = [
    "assets/images/equip_detail.png",
    "assets/images/equip_detail.png",
    "assets/images/equip_detail.png",
    "assets/images/equip_detail.png",
    "assets/images/equip_detail.png",
  ];

  void goBack() => _navigationService.back();

  void logWorkoutNavigation() => _navigationService.navigateToLogWorkoutView();
  void reportIssuesNavigation() =>
      _navigationService.navigateToReportIssuesView();
  void maintenanceReportNavigation() =>
      _navigationService.navigateToMaintenanceReportView();

  void changeNote(int index) {
    noteIndex = index;
    notifyListeners();
  }

  void navigateToReportIssues() {
    _navigationService.navigateTo(Routes.reportIssuesView);
  }

  void navigateToLogWorkOut() {
    _navigationService.navigateTo(Routes.logWorkoutView);
  }

  void navigateToMaintenanceReport() {
    _navigationService.navigateTo(Routes.maintenanceReportView);
  }

  final Map<String, dynamic> equipmentData = {
    "equipment": {
      "name": "Treadmill Adult Tool",
      "description":
          "A treadmill is a stationary exercise machine that allows users to walk, jog, or run indoors. It consists of a moving platform with a wide conveyor belt driven by an electric motor or flywheel. The speed and incline of the treadmill can be adjusted to simulate different walking or running conditions. Most treadmills come equipped with a display panel that shows key workout metrics such as speed, distance, time, and calories burned. Some advanced models also offer built-in workout programs, heart rate monitoring, and entertainment features like music or video screens."
    },
    "instructions": {
      "preparation":
          "Ensure the treadmill is properly set up and in a safe location with adequate clearance around it. Wear appropriate workout clothing and running shoes.",
      "startingTreadmill":
          "Stand on the side rails of the treadmill and attach the safety clip to your clothing. Start the treadmill at a low speed using the control panel.",
      "mountingTreadmill":
          "Carefully step onto the moving belt, starting with one foot and then the other. Begin walking at a slow, comfortable pace.",
      "adjustingSpeedIncline":
          "Gradually increase the speed to your desired walking, jogging, or running pace. Adjust the incline to add intensity or simulate outdoor terrain if desired.",
      "properForm":
          "Keep your head up, shoulders back, and core engaged. Swing your arms naturally as you walk or run. Ensure your feet land softly and maintain a consistent stride.",
      "monitoringWorkout":
          "Use the display panel to monitor your speed, distance, time, and calories burned. Adjust your speed or incline as needed to meet your workout goals.",
      "coolingDown":
          "Gradually reduce the speed to a walking pace to cool down. Walk for 3-5 minutes at a slow pace to bring your heart rate down.",
      "stoppingTreadmill":
          "Once cooled down, stop the treadmill using the control panel. Carefully step off the belt onto the side rails before exiting the machine."
    },
    "safetyTips": {
      "safetyClip":
          "Always attach the safety clip to your clothing. In case of a fall, the clip will stop the treadmill to prevent injury.",
      "startSlowly":
          "Begin your workout at a low speed and gradually increase it to avoid sudden movements that could cause you to lose balance.",
      "properFootwear":
          "Wear appropriate running shoes to provide adequate support and reduce the risk of slipping or injury.",
      "clearSurroundings":
          "Ensure there is enough space around the treadmill to avoid tripping over objects or bumping into walls or furniture.",
      "stayHydrated":
          "Keep a water bottle nearby and stay hydrated, especially during longer workouts.",
      "listenToBody":
          "Pay attention to any signs of discomfort or fatigue. If you feel dizzy, nauseous, or experience pain, stop the workout immediately.",
      "useHandrailsSparingly":
          "Handrails can help with balance but should not be used excessively as they can affect your posture and gait.",
      "regularMaintenance":
          "Ensure the treadmill is regularly maintained and inspected for any mechanical issues to prevent malfunctions during use."
    },
    "resources": {
      "video": "https://youtube.com/gym_link",
      "slide": "https://blog_link"
    }
  };
}
