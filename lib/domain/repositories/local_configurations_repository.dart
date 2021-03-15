import 'package:clean_project/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class LocalConfigurationsRepository {
  Future<Either<Failure, String>> getBaseUrl();
}
