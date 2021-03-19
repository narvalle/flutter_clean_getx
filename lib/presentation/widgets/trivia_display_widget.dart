import 'package:clean_project/domain/entities/number_trivia.dart';
import 'package:flutter/material.dart';

class TriviaDisplayWidget extends StatelessWidget {
  final NumberTrivia numberTrivia;

  const TriviaDisplayWidget({
    Key key,
    @required this.numberTrivia,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height / 3,
        child: Column(
          children: [
            Text(
              numberTrivia.number.toString(),
              style: Theme.of(context).textTheme.headline1,
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Text(
                    numberTrivia.text,
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
