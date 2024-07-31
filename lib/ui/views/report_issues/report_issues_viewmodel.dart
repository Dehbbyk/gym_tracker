import 'package:gym_tracker/app/app.locator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.dialogs.dart';

class ReportIssuesViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final ImagePicker _imagePicker = ImagePicker();
  bool _uploadImage = false;
  XFile? _selectedImage;

  bool get uploadImage => _uploadImage;
  XFile? get selectedImage => _selectedImage;

  void toggleUploadImage() {
    _uploadImage = !_uploadImage;
    notifyListeners();
  }

  Future<void> pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _selectedImage = pickedFile;
      notifyListeners();
    }
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.issueReported,
    );
  }
}
