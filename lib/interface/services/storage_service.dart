// Flutter imports:
import 'package:flutter/widgets.dart';


// Project imports:
import '../serializable.dart';

abstract class StorageService {
  Future<bool> exists({required String key});

  Future<Map<String, dynamic>?> get({required String key});

  Future<String> getRaw({required String key});

  Future<void> set({
    required String key,
    Serializable payload,
    String raw,
  });
}
