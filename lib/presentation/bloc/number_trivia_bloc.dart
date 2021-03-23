import 'package:bloc/bloc.dart';
import 'package:clean_project/core/error/failures.dart';
import 'package:clean_project/core/usecases/usecase.dart';
import '../../domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'dart:async';

import './bloc.dart';
import '../../domain/usecases/get_number_trivia_from_number.dart';
import '../../domain/usecases/get_number_trivia_random.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetNumberTriviaFromNumber getNumberTriviaFromNumber;
  final GetNumberTriviaRandom getNumberTriviaRandom;

  NumberTriviaBloc({
    @required GetNumberTriviaFromNumber fromNumber,
    @required GetNumberTriviaRandom random,
  })  : assert(fromNumber != null),
        assert(random != null),
        this.getNumberTriviaFromNumber = fromNumber,
        this.getNumberTriviaRandom = random,
        super(EmptyState());

  @override
  Stream<NumberTriviaState> mapEventToState(NumberTriviaEvent event) async* {
    if (event is GetNumberTriviaFromNumberEvent) {
      yield LoadingState();
      final failureOrTrivia = await getNumberTriviaFromNumber(
          Params(number: int.parse(event.number)));
      yield* _eitherLoadedOrErrorState(failureOrTrivia);
    } else if (event is GetNumberTriviaRandomEvent) {
      yield LoadingState();
      final failureOrTrivia = await getNumberTriviaRandom(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrTrivia);
    }
  }

  Stream<NumberTriviaState> _eitherLoadedOrErrorState(
    Either<Failure, NumberTrivia> failureOrTrivia,
  ) async* {
    yield failureOrTrivia.fold(
      (failure) => ErrorState(message: _mapFailureToMessage(failure)),
      (trivia) => LoadedState(trivia: trivia),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
