import 'dart:convert';
import 'dart:typed_data';

import 'package:nfc_manager/nfc_manager.dart';
import 'package:stacked/stacked.dart';

enum NFCOperation { read, write }

class NfcService with ListenableServiceMixin {
  bool _isProcessing = false;
  String _message = "";

  bool get isProcessing => _isProcessing;
  String get message => _message;

  NdefMessage _createNdefMessage({required Map<String, String> data}) {
    String jsonData = json.encode(data);
    Uint8List jsonBytes = utf8.encode(jsonData);
    return NdefMessage([NdefRecord.createMime('application/json', jsonBytes)]);
  }

  Future<void> _writeToTag(
      {required NfcTag nfcTag, required Map<String, String> data}) async {
    NdefMessage message = _createNdefMessage(data: data);
    await Ndef.from(nfcTag)?.write(message);
  }

  Future<void> _readFromTag({required NfcTag tag}) async {
    Map<String, dynamic> nfcData = {
      'nfca': tag.data['nfca'],
      'mifareultralight': tag.data['mifareultralight'],
      'ndef': tag.data['ndef']
    };

    String? decodedText;
    if (nfcData.containsKey('ndef')) {
      List<int> payload =
          nfcData['ndef']['cachedMessage']?['records']?[0]['payload'];
      decodedText = String.fromCharCodes(payload);

      // Decode JSON
      Map<String, dynamic> jsonData = json.decode(decodedText);
      _message = jsonData.toString();
    } else {
      _message = "No Data Found";
    }
    notifyListeners();
  }

  Future<void> startNFCOperation(
      {required NFCOperation nfcOperation, Map<String, String>? data}) async {
    try {
      _isProcessing = true;
      notifyListeners();

      bool isAvail = await NfcManager.instance.isAvailable();

      if (isAvail) {
        if (nfcOperation == NFCOperation.read) {
          _message = "Scanning";
        } else if (nfcOperation == NFCOperation.write) {
          _message = "Writing To Tag";
        }

        notifyListeners();

        NfcManager.instance.startSession(onDiscovered: (NfcTag nfcTag) async {
          if (nfcOperation == NFCOperation.read) {
            await _readFromTag(tag: nfcTag);
          } else if (nfcOperation == NFCOperation.write && data != null) {
            await _writeToTag(nfcTag: nfcTag, data: data);
            _message = "DONE";
          }

          _isProcessing = false;
          notifyListeners();
          await NfcManager.instance.stopSession();
        }, onError: (e) async {
          _isProcessing = false;
          _message = e.toString();
          notifyListeners();
        });
      } else {
        _isProcessing = false;
        _message = "Please Enable NFC From Settings";
        notifyListeners();
      }
    } catch (e) {
      _isProcessing = false;
      _message = e.toString();
      notifyListeners();
    }
  }
}
