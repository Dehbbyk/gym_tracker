import 'package:gym_tracker/app/app.locator.dart';
import 'package:gym_tracker/services/nfc_service.dart';
import 'package:stacked/stacked.dart';

class NfcViewModel extends ReactiveViewModel {
  final _nfcService = locator<NfcService>();

  bool get isProcessing => _nfcService.isProcessing;
  String get message => _nfcService.message;

  Future<void> startNFCOperation(
      NFCOperation operation, Map<String, String>? data) async {
    await _nfcService.startNFCOperation(nfcOperation: operation, data: data);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_nfcService];
}
