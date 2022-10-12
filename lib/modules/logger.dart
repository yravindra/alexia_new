// Package imports:
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

class NoOpLogger implements Logger {
  @override
  void close() {}

  @override
  void d(message, [error, StackTrace? stackTrace]) {}

  @override
  void e(message, [error, StackTrace? stackTrace]) {}

  @override
  void i(message, [error, StackTrace? stackTrace]) {}

  @override
  void log(Level level, message, [error, StackTrace? stackTrace]) {}

  @override
  void v(message, [error, StackTrace? stackTrace]) {}

  @override
  void w(message, [error, StackTrace? stackTrace]) {}

  @override
  void wtf(message, [error, StackTrace? stackTrace]) {}
}

@module
abstract class LogModule {
  @Singleton(env: [Environment.test])
  Logger getLoggerTest() {
    return NoOpLogger();
  }

  @Singleton(env: [Environment.dev])
  Logger getLoggerDev() {
    return Logger(
      printer: PrettyPrinter(
        methodCount: 3,
        printTime: true,
      ),
      level: Level.debug,
    );
  }

  @Singleton(env: [Environment.prod])
  Logger getLoggerProd() {
    return Logger(
      printer: PrettyPrinter(methodCount: 3),
      level: Level.info,
    );
  }
}
