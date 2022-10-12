// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'init_get_it.dart';
import 'modules/main.dart';

Future<void> main() async {
  initGetIt(env: Environment.dev);

  await Main.start();
}
