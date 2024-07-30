import 'package:gym_tracker/app/app.locator.dart';
import 'package:gym_tracker/app/app.router.dart';
import 'package:gym_tracker/services/nfc_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NfcViewModel extends ReactiveViewModel {
  final _nfcService = locator<NfcService>();
  final _navigationService = locator<NavigationService>();

  bool get isProcessing => _nfcService.isProcessing;
  String get message => _nfcService.message;

  Future<void> startNFCOperation(
      NFCOperation operation, Map<String, String>? data) async {
    await _nfcService.startNFCOperation(nfcOperation: operation, data: data);
  }

  Future<void> writeNFC() async{
    
  }

  void goBack() => _navigationService.back();

  void equipmentDetailsNavigation() =>
      _navigationService.navigateToEquipmentDetailView();

  @override
  List<ListenableServiceMixin> get listenableServices => [_nfcService];
}
