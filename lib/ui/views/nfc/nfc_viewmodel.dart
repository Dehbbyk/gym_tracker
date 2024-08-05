import 'package:gym_tracker/app/app.locator.dart';
import 'package:gym_tracker/app/app.router.dart';
import 'package:gym_tracker/services/app_service.dart';
import 'package:gym_tracker/services/nfc_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NfcViewModel extends ReactiveViewModel {
  final _nfcService = locator<NfcService>();
  final _navigationService = locator<NavigationService>();
  final _appService = locator<AppService>();

  bool get isProcessing => _nfcService.isProcessing;
  String get message => _nfcService.message;
  Map<String, dynamic> get readJsonData => _nfcService.jsonData;

  Future<void> startNFCOperation(
      NFCOperation operation, Map<String, String>? data) async {
    await _nfcService.startNFCOperation(nfcOperation: operation, data: data);
  }

  void goBack() => _navigationService.back();

  void equipmentDetailsNavigation() {
    _appService.onItemTapped(0);
    _navigationService.navigateTo(Routes.dashboardView);
   // _navigationService.navigateToEquipmentDetailView();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_nfcService];
}
