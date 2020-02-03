import 'package:moneda_par_app_dev/viewmodels/base_model.dart';

class MainViewModel extends BaseModel {
  int _index = 0;
  int get index => _index;

  void changeTab(int index) {
    _index = index;
    notifyListeners();
  }
}
