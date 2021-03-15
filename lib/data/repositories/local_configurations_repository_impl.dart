import 'package:clean_project/core/error/exceptions.dart';
import 'package:clean_project/core/error/failures.dart';
import 'package:clean_project/data/datasources/loca_configurations_data_source.dart';
import 'package:clean_project/domain/repositories/local_configurations_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class LocalConfigurationsImpl implements LocalConfigurationsRepository {
  final LocalConfigurationsDataSource localDataSource;

  LocalConfigurationsImpl({@required this.localDataSource});

  @override
  Future<Either<Failure, String>> getBaseUrl() async {
    try {
      final localUrl = await localDataSource.getBaseUrl();
      return Right(localUrl);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
