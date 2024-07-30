import 'package:stacked/stacked.dart';

class AppService with ListenableServiceMixin {
  int selectedIndex = 0;

  void onItemTapped(int value) {
    selectedIndex = value;
    notifyListeners();
  }
}
