import '../../core/error/exceptions.dart';
import '../datasources/user_data_source.dart';
import '../../domain/entities/user.dart';
import '../../core/error/failures.dart';
import '../../domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;

  UserRepositoryImpl({@required this.dataSource});

  @override
  Future<Either<Failure, User>> getUserFromId(int id) async {
    try {
      return Right(
        await dataSource.getUserFromId(id),
      );
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    try {
      return Right(
        await dataSource.getUsers(),
      );
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
