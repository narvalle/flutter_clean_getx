import 'package:clean_project/domain/entities/number_trivia.dart';
import 'package:flutter/material.dart';

class NumberTriviaModel extends NumberTrivia {
  NumberTriviaModel({
    @required String text,
    @required int number,
  }) : super(text: text, number: number);

  factory NumberTriviaModel.fromJsonMap(Map<String, dynamic> map) =>
      NumberTriviaModel(
        text: map['text'],
        number: (map['number'] as num).toInt(),
      );

  Map<String, dynamic> toJsonMap() => {
        'text': text,
        'number': number,
      };
}
