import 'package:clean_project/core/error/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalConfigurationsDataSource {
  Future<String> getBaseUrl();
}

const CACHED_BASE_URL = 'base_url';

class LocalConfigurationsDataSourceImpl
    implements LocalConfigurationsDataSource {
  final SharedPreferences sharedPreferences;

  LocalConfigurationsDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<String> getBaseUrl() {
    final jsonString = sharedPreferences.getString(CACHED_BASE_URL);
    if (jsonString != null) {
      return Future.value(jsonString);
    } else {
      throw CacheException();
    }
  }
}
