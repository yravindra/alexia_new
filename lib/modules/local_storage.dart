// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';


// Project imports:
import '../interface/serializable.dart';
import '../interface/services/storage_service.dart';

@Singleton(as: StorageService, env: [Environment.prod, Environment.dev])
class LocalStorage implements StorageService {
  final secureStorage = const FlutterSecureStorage();

  @override
  Future<bool> exists({required String key}) {
    final storage = secureStorage;

    return storage.containsKey(key: key);
  }

  @override
  Future<Map<String, dynamic>?> get({required String key}) async {
    final storage = secureStorage;

    final raw = await storage.read(key: key);

    if (raw == null) {
      return null;
    }

    final jsonMap = jsonDecode(raw);

    return jsonMap;
  }

  @override
  Future<String> getRaw({required String key}) async {
    final storage = secureStorage;

    final raw = await storage.read(key: key);

    return raw ?? "";
  }

  @override
  Future<void> set({
    required String key,
    Serializable? payload,
    String? raw,
  }) async {
    final storage = secureStorage;

    String marshaled;

    if (payload != null) {
      final jsonMap = payload.toJson();

      marshaled = jsonEncode(jsonMap);
    } else if (raw != null) {
      marshaled = raw;
    } else {
      throw ArgumentError("either payload or raw needs to be provided");
    }

    await storage.write(key: key, value: marshaled);
  }
}
