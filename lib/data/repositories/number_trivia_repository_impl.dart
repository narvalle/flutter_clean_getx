import 'package:clean_project/core/error/exceptions.dart';
import 'package:clean_project/data/datasources/number_trivia_data_source.dart';
import 'package:clean_project/domain/entities/number_trivia.dart';
import 'package:clean_project/core/error/failures.dart';
import 'package:clean_project/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

typedef Future<NumberTrivia> _GetTriviaFromServer();

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaDataSource dataSource;

  NumberTriviaRepositoryImpl({@required this.dataSource});

  @override
  Future<Either<Failure, NumberTrivia>> getNumberTriviaFromNumber(
    int number,
  ) async =>
      await _getTrivia(
        () => dataSource.getNumberTriviaFromNumber(number),
      );

  @override
  Future<Either<Failure, NumberTrivia>> getNumberTriviaRandom() async =>
      await _getTrivia(
        () => dataSource.getNumberTriviaRandom(),
      );

  Future<Either<Failure, NumberTrivia>> _getTrivia(
      _GetTriviaFromServer getTriviaFromServer) async {
    try {
      return Right(await getTriviaFromServer());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
