import 'package:nfc_manager/nfc_manager.dart';
import 'package:stacked/stacked.dart';

class LoggedWorkoutViewModel extends BaseViewModel {
  String? _duration;
  String? _typeOfExercise;
  String? _size;
  String? _repetition;

  // Getters
  String? get duration => _duration;
  String? get typeOfExercise => _typeOfExercise;
  String? get size => _size;
  String? get repetition => _repetition;

  // Setters
  void setDuration(String value) {
    _duration = value;
    notifyListeners();
  }

  void setTypeOfExercise(String value) {
    _typeOfExercise = value;
    notifyListeners();
  }

  void setSize(String value) {
    _size = value;
    notifyListeners();
  }

  void setRepetition(String value) {
    _repetition = value;
    notifyListeners();
  }

  // Validation method
  bool validateInputs() {
    return _duration != null && _duration!.isNotEmpty &&
        _typeOfExercise != null && _typeOfExercise!.isNotEmpty &&
        _size != null && _size!.isNotEmpty &&
        _repetition != null && _repetition!.isNotEmpty;
  }

  // Method to save the workout data
  void saveWorkout() {
    if (validateInputs()) {
      // Logic to save workout, e.g., sending data to a backend or local storage
      // For now, we'll just print the data
      print('Workout saved: Duration - $_duration, Type of Exercise - $_typeOfExercise, Size - $_size, Repetition - $_repetition');
      // Write to NFC Tag
      _writeToNfcTag();
    } else {
      print('Invalid input');
    }
  }

  void _writeToNfcTag() async {
    String nfcMessage = '$_typeOfExercise: $_duration, $_size, $_repetition';
    bool isAvailable = await NfcManager.instance.isAvailable();
    if (isAvailable) {
      NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          // Write the message to the NFC tag
          Ndef? ndef = Ndef.from(tag);
          if (ndef != null && ndef.isWritable) {
            NdefMessage message = NdefMessage([
              NdefRecord.createText(nfcMessage),
            ]);
            try {
              await ndef.write(message);
              print('NFC Tag Written: $nfcMessage');
              NfcManager.instance.stopSession();
            } catch (e) {
              print('Failed to write to NFC tag: $e');
              NfcManager.instance.stopSession(errorMessage: e.toString());
            }
          } else {
            print('NFC Tag is not writable');
            NfcManager.instance.stopSession(errorMessage: 'NFC Tag is not writable');
          }
        },
      );
    } else {
      print('NFC is not available');
    }
  }
}
