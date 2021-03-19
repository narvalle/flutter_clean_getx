import 'package:clean_project/core/error/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';

abstract class LocalConfigurationsDataSource {
  String getBaseUrl();
}

const CACHED_BASE_URL = 'base_url';

class LocalConfigurationsDataSourceImpl
    implements LocalConfigurationsDataSource {
  final GlobalConfiguration globalConfiguration;

  LocalConfigurationsDataSourceImpl({@required this.globalConfiguration});

  @override
  String getBaseUrl() {
    final jsonString = globalConfiguration.getValue<String>(CACHED_BASE_URL);
    if (jsonString != null) {
      return jsonString;
    } else {
      throw CacheException();
    }
  }
}
