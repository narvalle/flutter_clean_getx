import 'package:clean_project/core/error/failures.dart';
import 'package:clean_project/core/usecases/usecase.dart';
import 'package:clean_project/domain/entities/number_trivia.dart';
import 'package:clean_project/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';

class GetNumberTriviaRandom implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository _repository;

  GetNumberTriviaRandom(this._repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async =>
      await _repository.getNumberTriviaRandom();
}
