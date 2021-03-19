import 'package:clean_project/core/utils/http_manager.dart';
import 'package:clean_project/data/models/number_trivia_model.dart';
import 'package:flutter/material.dart';

abstract class NumberTriviaDataSource {
  Future<NumberTriviaModel> getNumberTriviaFromNumber(int number);
  Future<NumberTriviaModel> getNumberTriviaRandom();
}

class NumberTriviaDataSourceImpl implements NumberTriviaDataSource {
  final HttpManager httpManager;

  NumberTriviaDataSourceImpl({@required this.httpManager});

  @override
  Future<NumberTriviaModel> getNumberTriviaFromNumber(int number) async =>
      NumberTriviaModel.fromJsonMap(
        await httpManager.get(
          path: number.toString(),
        ),
      );

  @override
  Future<NumberTriviaModel> getNumberTriviaRandom() async =>
      NumberTriviaModel.fromJsonMap(
        await httpManager.get(
          path: 'random',
        ),
      );
}
