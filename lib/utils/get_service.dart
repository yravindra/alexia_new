// Package imports:
import 'package:get_it/get_it.dart';

T getService<T extends Object>() {
  final getIt = GetIt.instance;

  return getIt.get<T>();
}
