import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NumberTriviaEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetNumberTriviaFromNumber extends NumberTriviaEvent {
  final String number;

  GetNumberTriviaFromNumber(this.number);

  @override
  List<Object> get props => [number];
}

class GetNumberTriviaRandom extends NumberTriviaEvent {}
