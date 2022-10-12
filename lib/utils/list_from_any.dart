// Project imports:

import 'app_exception.dart';

List<T> listFromAny<T>(
  dynamic json,
  T Function(Map<String, dynamic> json) parser,
) {
  if (json is! List) {
    throw InvalidJSONException();
  }

  final List list = json;

  final mapped = list.map((each) => parser(each));

  final parsed = mapped.toList(growable: false);

  return parsed;
}
