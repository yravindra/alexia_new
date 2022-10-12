// Package imports:
import 'package:injectable/injectable.dart';

const KWEB_API = "KWEB_API";
const kweb_api = Named(KWEB_API);

@module
abstract class AtomApiModule {
  @kweb_api
  @Singleton(env: [Environment.prod])
  String get production => "http://skope.company/atomosphere";

  @kweb_api
  @Singleton(env: [Environment.dev, Environment.test])
  String get development => "http://skope.company/atomosphere";
}
