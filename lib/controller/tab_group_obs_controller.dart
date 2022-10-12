// Package imports:
import 'package:get/get.dart';

//Project Option:

class TabGroupObsController extends GetxController {
  final Rx<String> _selectedOption;

  TabGroupObsController({String? defaultOption})
      : _selectedOption = (defaultOption ?? default_option).obs;

  String getValue() {
    return _selectedOption.value;
  }

  void setValue(String option) {
    _selectedOption.value = option;
  }
}

const default_option = "";
