import 'package:nfc_manager/nfc_manager.dart';
import 'package:stacked/stacked.dart';

class LogWorkoutViewModel extends BaseViewModel {
  String _duration = '';
  String _typeOfExercise = '';
  String _weight = '';
  String _repetition = '';

  String get duration => _duration;
  String get typeOfExercise => _typeOfExercise;
  String get weight => _weight;
  String get repetition => _repetition;

  void setDuration(String value) {
    _duration = value;
    notifyListeners();
  }

  void setTypeOfExercise(String value) {
    _typeOfExercise = value;
    notifyListeners();
  }

  void setWeight(String value) {
    _weight = value;
    notifyListeners();
  }

  void setRepetition(String value) {
    _repetition = value;
    notifyListeners();
  }

  void saveWorkout() {
    // Save the workout data logic
  }

  Future<void> readNfcTag() async {
    if (await NfcManager.instance.isAvailable()) {
      try {
        await NfcManager.instance.startSession(
            onDiscovered: (NfcTag tag) async {
          Ndef? ndef = Ndef.from(tag);
          if (ndef == null) {
            print('Tag is not NDEF');
            return;
          }
          final message = ndef.cachedMessage;
          if (message != null) {
            for (NdefRecord record in message.records) {
              if (record.typeNameFormat == NdefTypeNameFormat.nfcWellknown &&
                  record.type == 'T') {
                final languageCodeLength = record.payload.first;
                final languageCode = String.fromCharCodes(
                    record.payload.sublist(1, 1 + languageCodeLength));
                final payload = String.fromCharCodes(
                    record.payload.sublist(1 + languageCodeLength));
                // Handle payload data
                print('NFC Tag read: $payload');
              }
            }
          }
          NfcManager.instance.stopSession();
        });
      } catch (e) {
        print('Error reading NFC tag: $e');
      }
    } else {
      print('NFC is not available');
    }
  }

  Future<void> writeNfcTag(String data) async {
    if (await NfcManager.instance.isAvailable()) {
      try {
        await NfcManager.instance.startSession(
            onDiscovered: (NfcTag tag) async {
          Ndef? ndef = Ndef.from(tag);
          if (ndef == null) {
            print('Tag is not NDEF');
            return;
          }
          if (!ndef.isWritable) {
            print('Tag is not writable');
            return;
          }

          NdefMessage message = NdefMessage([
            NdefRecord.createText(data),
          ]);

          try {
            await ndef.write(message);
            print('NFC Tag written successfully');
          } catch (e) {
            print('Error writing NFC tag: $e');
          }
          NfcManager.instance.stopSession();
        });
      } catch (e) {
        print('Error writing NFC tag: $e');
      }
    } else {
      print('NFC is not available');
    }
  }
}
