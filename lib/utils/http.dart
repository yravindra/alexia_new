// Dart imports:
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

// Project imports:
import '../interface/services/storage_service.dart';
import 'app_exception.dart';

const DEFAULT_HEADERS = {
  "Accept": "application/json",
  "Content-Type": "application/json",
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Credentials": "true",
  "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
};

@singleton
class Http {
  final Logger logger;
  final http.Client client;
  final StorageService storage;

  dynamic _returnResponse(
    http.Response response, {
    Map<String, dynamic>? body,
  }) {
    final request = response.request;

    final uri = request?.url.toString() ?? "";

    final method = request?.method ?? "";

    final headers = request?.headers ?? {};

    final status = response.statusCode;

    logger.i("[$method] [$status] $uri");

    logger.d(headers);

    if (body != null) {
      logger.d(body);
    }

    Map<String, dynamic> decoded = {};

    String errorMsg = "";

    try {
      decoded = jsonDecode(response.body);

      this.logger.d(decoded);
    } catch (e) {
      errorMsg = response.body.toString();

      logger.d(errorMsg);

      throw InvalidJSONException(errorMsg);
    }

    if (status >= 200 && status < 400) {
      return decoded;
    }

    if (decoded.containsKey("meta")) {
      final Map<String, dynamic> meta = decoded["meta"];

      if (meta.containsKey("message")) {
        errorMsg = meta["message"];
      }
    }

    if (status == 422) {
      throw ValidationException(errorMsg);
    }

    if (status == 404) {
      throw NotFoundException(errorMsg);
    }

    if (status == 403) {
      throw UnauthorisedException(errorMsg);
    }

    if (status == 401) {
      throw UnauthorisedException(errorMsg);
    }

    throw InternalException("[$status] [$errorMsg}]");
  }

  Http({
    required this.logger,
    required this.client,
    required this.storage,
  });

  Future<Map<String, dynamic>> get({
    required Uri uri,
    Map<String, String> headers = const {},
  }) async {
    try {
      final _headers = {
        ...DEFAULT_HEADERS,
        ...headers,
      };

      final response = await client.get(uri, headers: _headers);

      return _returnResponse(response);
    } on SocketException {
        throw DataLayerException('No Internet connection!');
      }
  }

  Future<Map<String, dynamic>> post({
    required Uri uri,
    Map<String, String> headers = const {},
    Map<String, dynamic>? body,
  }) async {
    try {
      final _headers = {
        ...DEFAULT_HEADERS,
        ...headers,
        "Access-Control-Allow-Methods": "POST, OPTIONS",
      };

      final encoded = jsonEncode(body);

      final http.Response response = await client.post(
        uri,
        headers: _headers,
        body: encoded,
      );

      return _returnResponse(response, body: body);
    } on SocketException {
      throw DataLayerException('No Internet connection!');
    }
  }

  Future<Map<String, dynamic>> postMultipart({
    required Uri uri,
    Map<String, String> headers = const {},
    Map<String, String> body = const {},
    required String? photoPath,
    required String? photoIdPath,
    required String? vaccinePath,
  }) async {
    try {
      final _headers = {
        ...DEFAULT_HEADERS,
        ...headers,
      };

      final request = http.MultipartRequest("POST", uri);

      if(photoPath != null && photoPath.isNotEmpty) {
        final multipartFile = await http.MultipartFile.fromPath('photo', photoPath);
        request.files.add(multipartFile);
      }

      if(photoIdPath != null && photoIdPath.isNotEmpty) {
        final multipartFilePhotoId = await http.MultipartFile.fromPath('photo_id_file', photoIdPath);
        request.files.add(multipartFilePhotoId);
      }


      if(vaccinePath != null && vaccinePath.isNotEmpty) {
        final multipartFileVaccine = await http.MultipartFile.fromPath('vc_file', vaccinePath);
        request.files.add(multipartFileVaccine);
      }

      request.headers.addAll(_headers);

      request.fields.addAll(body);

      final http.StreamedResponse stream = await request.send();

      final http.Response response = await http.Response.fromStream(stream);

      return _returnResponse(response);
    } on SocketException {
      throw DataLayerException('No Internet connection!');
    }
  }

  Future<Map<String, dynamic>> put({
    required Uri uri,
    Map<String, String> headers = const {},
    Map<String, dynamic>? body,
  }) async {
    try {
      final _headers = {
        ...DEFAULT_HEADERS,
        ...headers,
      };

      final encoded = jsonEncode(body);

      final http.Response response = await client.put(
        uri,
        headers: _headers,
        body: encoded,
      );

      return _returnResponse(response, body: body);
    } on SocketException {
      throw DataLayerException('No Internet connection!');
    }
  }

  Future<Map<String, dynamic>> patch({
    required Uri uri,
    Map<String, String> headers = const {},
    Map<String, dynamic>? body,
  }) async {
    try {
      final _headers = {
        ...DEFAULT_HEADERS,
        ...headers,
      };

      final encoded = jsonEncode(body);

      final http.Response response = await client.patch(
        uri,
        headers: _headers,
        body: encoded,
      );

      return _returnResponse(response, body: body);
    } on SocketException {
      throw DataLayerException('No Internet connection!');
    }
  }

  Future<Map<String, dynamic>> delete({
    required Uri uri,
    Map<String, String> headers = const {},
  }) async {
    try {
      final _headers = {
        ...DEFAULT_HEADERS,
        ...headers,
      };

      final http.Response response =
          await client.delete(uri, headers: _headers);

      return _returnResponse(response);
    } on SocketException {
      throw DataLayerException('No Internet connection!');
    }
  }
}
