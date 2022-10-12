// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class DismissKeyboardNavigationObserver extends NavigatorObserver {
  @override
  void didStartUserGesture(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    super.didStartUserGesture(route, previousRoute);
  }
}
