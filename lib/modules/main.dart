// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:get_it/get_it.dart';


// Project imports:
import 'application.dart';

class Main {
  static GetIt container = GetIt.instance;

  static Future start() async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    final application = container.get<Application>();

    return runApp(application);
  }
}
