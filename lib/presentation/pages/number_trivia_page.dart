import 'package:clean_project/injection_container.dart';
import 'package:clean_project/presentation/bloc/bloc.dart';
import 'package:clean_project/presentation/widgets/loading_widget.dart';
import 'package:clean_project/presentation/widgets/message_display_widget.dart';
import 'package:clean_project/presentation/widgets/trivia_display_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Number Trivia Bloc',
          ),
        ),
        body: SingleChildScrollView(
          child: buildBody(context),
        ),
      );

  BlocProvider<NumberTriviaBloc> buildBody(BuildContext context) =>
      BlocProvider(
        create: (_) => gi<NumberTriviaBloc>(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: 10),
                BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
                  builder: (_, state) {
                    if (state is Empty) {
                      return MessageDisplayWidget(
                        message: 'Start searching',
                      );
                    } else if (state is Loading) {
                      return LoadingWidget();
                    } else if (state is Loaded) {
                      return TriviaDisplayWidget(
                        numberTrivia: state.trivia,
                      );
                    } else if (state is Error) {
                      return MessageDisplayWidget(
                        message: state.message,
                      );
                    } else {
                      print(state);
                      return Container();
                    }
                  },
                ),
                SizedBox(height: 20),
                
              ],
            ),
          ),
        ),
      );
}
