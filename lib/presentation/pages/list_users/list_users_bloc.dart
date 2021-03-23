import '../../../core/usecases/usecase.dart';
import '../../../domain/usecases/user/get_users.dart';
import '../../../core/error/failures.dart';
import '../../../core/error/manager_error.dart';
import '../../../domain/entities/user.dart';

import 'list_users_event.dart';
import 'list_users_state.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListUsersBloc extends Bloc<ListUsersEvent, ListUsersState> {
  final GetUsers getUsers;

  ListUsersBloc({@required GetUsers users})
      : assert(users != null),
        this.getUsers = users,
        super(EmptyState());

  @override
  Stream<ListUsersState> mapEventToState(ListUsersEvent event) async* {
    yield LoadingState();
    final failureOrData = await getUsers(NoParams());
    yield* _eitherLoadedOrErrorState(failureOrData);
  }

  Stream<ListUsersState> _eitherLoadedOrErrorState(
      Either<Failure, List<User>> failureOrData) async* {
    yield failureOrData.fold(
      (failure) => ErrorState(message: mapFailureMessage(failure)),
      (data) => LoadedState(users: data),
    );
  }
}
