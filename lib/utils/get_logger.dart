// Package imports:
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

Logger getLogger() {
  final getIt = GetIt.instance;

  return getIt.get<Logger>();
}
