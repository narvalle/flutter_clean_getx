import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NumberTriviaEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetNumberTriviaFromNumberEvent extends NumberTriviaEvent {
  final String number;

  GetNumberTriviaFromNumberEvent(this.number);

  @override
  List<Object> get props => [number];
}

class GetNumberTriviaRandomEvent extends NumberTriviaEvent {}
