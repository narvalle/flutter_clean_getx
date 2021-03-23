import 'package:clean_project/core/error/failures.dart';
import 'package:clean_project/core/usecases/usecase.dart';
import 'package:clean_project/domain/entities/number_trivia.dart';
import 'package:clean_project/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class GetNumberTriviaFromNumber implements UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository repository;

  GetNumberTriviaFromNumber(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async =>
      await repository.getNumberTriviaFromNumber(params.number);
}

class Params extends Equatable {
  final int number;

  Params({@required this.number});

  @override
  List<Object> get props => [number];
}
