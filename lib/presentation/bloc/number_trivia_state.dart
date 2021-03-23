import 'package:clean_project/domain/entities/number_trivia.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NumberTriviaState extends Equatable {
  @override
  List<Object> get props => [];
}

class EmptyState extends NumberTriviaState {}

class LoadingState extends NumberTriviaState {}

class LoadedState extends NumberTriviaState {
  final NumberTrivia trivia;

  LoadedState({@required this.trivia});

  @override
  List<Object> get props => [trivia];
}

class ErrorState extends NumberTriviaState {
  final String message;

  ErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
