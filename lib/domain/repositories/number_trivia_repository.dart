import '../../core/error/failures.dart';
import '../entities/number_trivia.dart';
import 'package:dartz/dartz.dart';


abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getNumberTriviaFromNumber(int number);
  Future<Either<Failure, NumberTrivia>> getNumberTriviaRandom();
}