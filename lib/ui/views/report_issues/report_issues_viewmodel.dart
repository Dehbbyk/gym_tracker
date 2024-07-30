import 'package:stacked/stacked.dart';

class ReportIssuesViewModel extends BaseViewModel {
  bool _uploadImage = false;

  bool get uploadImage => _uploadImage;

  void toggleUploadImage() {
    _uploadImage = !_uploadImage;
    notifyListeners();
  }
}
