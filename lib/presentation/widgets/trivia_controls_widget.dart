import 'package:clean_project/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TriviaControlsWidget extends StatefulWidget {
  const TriviaControlsWidget({Key key}) : super(key: key);

  @override
  _TriviaControlsWidgetState createState() => _TriviaControlsWidgetState();
}

class _TriviaControlsWidgetState extends State<TriviaControlsWidget> {
  final _controller = TextEditingController();
  String inputStr;
  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Input number',
            ),
            onChanged: (txt) {
              inputStr = txt;
            },
            onSubmitted: (_) {
              _dispatchFromNumber();
            },
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  child: Text('Search'),
                  color: Theme.of(context).accentColor,
                  textTheme: ButtonTextTheme.primary,
                  onPressed: _dispatchFromNumber,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: RaisedButton(
                  child: Text('Get random trivia'),
                  onPressed: _dispatchRandom,
                ),
              ),
            ],
          ),
        ],
      );

  void _dispatchFromNumber() {
    _controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context)
        .add(GetNumberTriviaFromNumber(inputStr));
  }

  void _dispatchRandom() {
    _controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context).add(GetNumberTriviaRandom());
  }
}
