import 'package:nfc_manager/nfc_manager.dart';
import 'package:stacked/stacked.dart';

class LogWorkoutViewModel extends BaseViewModel {
  String? _duration;
  String? _typeOfExercise;
  String? _size;
  String? _repetition;
  String _nfcStatus = '';

  // Getters
  String? get duration => _duration;
  String? get typeOfExercise => _typeOfExercise;
  String? get size => _size;
  String? get repetition => _repetition;
  String get nfcStatus => _nfcStatus;

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
      print('Workout saved: Duration - $_duration, Type of Exercise - $_typeOfExercise, Size - $_size, Repetition - $_repetition');
      _nfcStatus = 'Workout saved successfully';
      notifyListeners();
    } else {
      _nfcStatus = 'Please fill all the fields.';
      notifyListeners();
    }
  }

  // Method to write workout data to an NFC tag
  void writeToNfcTag() async {
    if (!validateInputs()) {
      _nfcStatus = 'Please fill all the fields before saving to NFC.';
      notifyListeners();
      return;
    }

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
              _nfcStatus = 'NFC Tag Written: $nfcMessage';
              NfcManager.instance.stopSession();
            } catch (e) {
              _nfcStatus = 'Failed to write to NFC tag: $e';
              NfcManager.instance.stopSession(errorMessage: e.toString());
            }
          } else {
            _nfcStatus = 'NFC Tag is not writable';
            NfcManager.instance.stopSession(errorMessage: 'NFC Tag is not writable');
          }
        },
      );
    } else {
      _nfcStatus = 'NFC is not available';
    }

    notifyListeners();
  }
}
