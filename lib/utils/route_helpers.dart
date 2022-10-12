// Package imports:
import 'package:path_to_regexp/path_to_regexp.dart';

bool isRouteMatch({
  required String pathTemplate,
  required String path,
  bool prefix = false,
}) {
  if (pathTemplate == path) {
    return true;
  }

  final parameters = <String>[];

  final regexp = pathToRegExp(
    pathTemplate,
    parameters: parameters,
    prefix: prefix,
  );

  final isMatch = regexp.hasMatch(path);

  return isMatch;
}

Map<String, String> getRouteParams({
  required String pathTemplate,
  required String path,
}) {
  final parameters = <String>[];

  final regexp = pathToRegExp(pathTemplate, parameters: parameters);

  final match = regexp.matchAsPrefix(path);

  if (match == null) {
    return {};
  }

  final params = extract(parameters, match);

  return params;
}
