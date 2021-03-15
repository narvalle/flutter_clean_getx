import 'package:bloc/bloc.dart';
import 'package:clean_project/core/error/failures.dart';
import 'package:clean_project/core/usecases/usecase.dart';
import '../../domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'dart:async';

import './bloc.dart' as _bloc;
import '../../domain/usecases/get_number_trivia_from_number.dart';
import '../../domain/usecases/get_number_trivia_random.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class NumberTriviaBloc
    extends Bloc<_bloc.NumberTriviaEvent, _bloc.NumberTriviaState> {
  final GetNumberTriviaFromNumber getNumberTriviaFromNumber;
  final GetNumberTriviaRandom getNumberTriviaRandom;

  NumberTriviaBloc({
    @required GetNumberTriviaFromNumber fromNumber,
    @required GetNumberTriviaRandom random,
  })  : assert(fromNumber != null),
        assert(random != null),
        this.getNumberTriviaFromNumber = fromNumber,
        this.getNumberTriviaRandom = random,
        super(_bloc.Empty());

  @override
  Stream<_bloc.NumberTriviaState> mapEventToState(
      _bloc.NumberTriviaEvent event) async* {
    if (event is _bloc.GetNumberTriviaFromNumber) {
      yield _bloc.Loading();
      final failureOrTrivia = await getNumberTriviaFromNumber(
          Params(number: int.parse(event.number)));
      yield* _eitherLoadedOrErrorState(failureOrTrivia);
    } else if (event is _bloc.GetNumberTriviaFromNumber) {
      yield _bloc.Loading();
      final failureOrTrivia = await getNumberTriviaRandom(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrTrivia);
    }
  }

  Stream<_bloc.NumberTriviaState> _eitherLoadedOrErrorState(
    Either<Failure, NumberTrivia> failureOrTrivia,
  ) async* {
    yield failureOrTrivia.fold(
      (failure) => _bloc.Error(message: _mapFailureToMessage(failure)),
      (trivia) => _bloc.Loaded(trivia: trivia),
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
