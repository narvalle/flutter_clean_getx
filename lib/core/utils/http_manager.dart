import 'dart:convert';
import 'dart:io';
import 'package:clean_project/core/error/exceptions.dart';
import 'package:clean_project/domain/repositories/local_configurations_repository.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

abstract class HttpManager {
  Future get({
    @required String path,
    Map<String, dynamic> query,
    Map<String, dynamic> headers,
    String token,
  });

  Future<Stream<T>> getSteam<T>({
    @required String path,
    Map<String, dynamic> query,
    Map<String, dynamic> headers,
    String token,
    T Function(dynamic) decoder,
  });
}

class HttpManagerImpl implements HttpManager {
  final LocalConfigurationsRepository repository;

  HttpManagerImpl({@required this.repository});

  @override
  Future get({
    @required String path,
    Map<String, dynamic> query,
    Map<String, dynamic> headers,
    String token,
  }) async =>
      _returnResponse(
        response: await http
            .get(
          _queryBuilder(path, query),
          headers: _headerBuilder(),
        )
            .timeout(
          Duration(minutes: 1),
          onTimeout: () {
            throw ServerException();
          },
        ),
      );

  @override
  Future<Stream<T>> getSteam<T>({
    @required String path,
    Map<String, dynamic> query,
    Map<String, dynamic> headers,
    String token,
    T Function(dynamic) decoder,
  }) async {
    final st = await http.Client().send(
      http.Request(
        'get',
        _getUri(path),
      ),
    );

    return st.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) => _getDataFromMap(data))
        .expand((data) => (data as List))
        .map((data) => decoder(data));
  }

  _getDataFromMap(Map<String, dynamic> map) => map['data'];

  _getUri(String path) async {
    final inputEither = await repository.getBaseUrl();
    final baseUrl = inputEither.fold(
      (failure) {
        throw CacheException();
      },
      (localCache) => localCache,
    );
    String _path = Uri.parse(baseUrl).path;
    if (!_path.endsWith('/')) {
      _path += '/';
    }
    Uri uri = Uri(
        scheme: Uri.parse(baseUrl).scheme,
        host: Uri.parse(baseUrl).host,
        port: Uri.parse(baseUrl).port,
        path: _path + path);
    return uri;
  }

  Map<String, String> _headerBuilder([String token]) {
    final headers = Map<String, String>();
    headers[HttpHeaders.acceptHeader] = 'application/json';
    headers[HttpHeaders.contentTypeHeader] = 'application/json';
    if (token != null) {
      headers['token'] = token;
    }
    if (headers != null && headers.isNotEmpty) {
      headers.forEach((key, value) {
        headers[key] = value;
      });
    }
    return headers;
  }

  _queryBuilder(String path, Map<String, dynamic> query) async {
    final buffer = StringBuffer();
    final inputEither = await repository.getBaseUrl();
    final baseUrl = inputEither.fold(
      (failure) {
        throw CacheException();
      },
      (localCache) => localCache,
    );
    buffer.write(baseUrl);
    if (query != null) {
      if (query.isNotEmpty) {
        buffer.write('?');
      }
      query.forEach((key, value) {
        buffer.write('$key=$value&');
      });
    }
    print(buffer);
    return buffer.toString();
  }

  dynamic _returnResponse({
    @required http.Response response,
    String bodyParametter,
  }) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      if (bodyParametter == null)
        return json.decode(response.body);
      else
        return json.decode(response.body)[bodyParametter];
    }
    throw ServerException();
  }
}
