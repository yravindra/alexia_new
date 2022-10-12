// Package imports:
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'init_get_it.config.dart';

@InjectableInit()
void initGetIt({required String env}) {
  final getIt = GetIt.instance;

  $initGetIt(getIt, environment: env);
}
