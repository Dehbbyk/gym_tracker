import 'package:gym_tracker/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:gym_tracker/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:gym_tracker/ui/views/home/home_view.dart';
import 'package:gym_tracker/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:gym_tracker/ui/views/sign_in/sign_in_view.dart';
import 'package:gym_tracker/ui/views/sign_up/sign_up_view.dart';
import 'package:gym_tracker/services/nfc_service.dart';
import 'package:gym_tracker/ui/views/nfc/nfc_view.dart';
import 'package:gym_tracker/ui/views/equipment_detail/equipment_detail_view.dart';
import 'package:gym_tracker/ui/views/log_workout/log_workout_view.dart';
import 'package:gym_tracker/ui/views/logged_workout/logged_workout_view.dart';
import 'package:gym_tracker/ui/views/maintaince_history/maintaince_history_view.dart';
import 'package:gym_tracker/ui/views/report_issues/report_issues_view.dart';
import 'package:gym_tracker/ui/views/onboarding/onboarding_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: SignInView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: NfcView),
    MaterialRoute(page: EquipmentDetailView),
    MaterialRoute(page: LogWorkoutView),
    MaterialRoute(page: LoggedWorkoutView),
    MaterialRoute(page: MaintainceHistoryView),
    MaterialRoute(page: ReportIssuesView),
    MaterialRoute(page: OnboardingView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: NfcService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
