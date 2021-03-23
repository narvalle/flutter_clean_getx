import 'package:clean_project/injection_container.dart';
import 'package:clean_project/presentation/pages/list_users/list_users_bloc.dart';
import 'package:clean_project/presentation/pages/list_users/list_users_event.dart';
import 'package:clean_project/presentation/pages/list_users/list_users_state.dart';
import 'package:clean_project/presentation/widgets/list_user_widget.dart';
import 'package:clean_project/presentation/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListUsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        child: NestedScrollView(
          headerSliverBuilder: (_, bool innerBoxIsScrolled) => <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Users'),
            ),
          ],
          body: listUsers(context),
        ),
      );

  BlocProvider<ListUsersBloc> listUsers(BuildContext context) => BlocProvider(
        create: (_) => gi<ListUsersBloc>()..add(GetUsersEvent()),
        child: BlocBuilder<ListUsersBloc, ListUsersState>(
          builder: (_, state) {
            if (state is EmptyState)
              return Container();
            else if (state is LoadingState)
              return LoadingWidget();
            else if (state is LoadedState)
              return ListUserWidget(
                users: state.users,
              );
            else if (state is ErrorState)
              return Center(
                child: Text(state.message),
              );
            else
              return Container();
          },
        ),
      );
}
