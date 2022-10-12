// Package imports:
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements Client {}

@module
abstract class HttpClientModule {
  @Singleton(env: [Environment.prod, Environment.dev])
  Client get httpClientProd => Client();

  @Singleton(env: [Environment.test])
  Client get httpClientTest => MockClient();
}
