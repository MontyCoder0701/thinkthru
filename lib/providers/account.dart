import 'package:flutter/foundation.dart';

import '../repositories/shared_preferences.dart';

class AccountProvider with ChangeNotifier {
  bool isLocked = false;
  final _repository = SharedPreferencesRepository();

  void toggleIsLocked() {
    isLocked = !isLocked;
    _repository.setBool('isLocked', isLocked);
    notifyListeners();
  }
}
