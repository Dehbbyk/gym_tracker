import 'package:stacked/stacked.dart';

class EquipmentDetailViewModel extends BaseViewModel {
  int noteIndex = 0;

  List<String> onboardingNotes = [
    "assets/images/equip_detail.png",
    "assets/images/equip_detail.png",
    "assets/images/equip_detail.png",
    "assets/images/equip_detail.png",
    "assets/images/equip_detail.png",
  ];

  void changeNote(int index) {
    noteIndex = index;
    notifyListeners();
  }
}
