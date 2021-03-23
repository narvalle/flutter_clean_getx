import 'package:clean_project/domain/entities/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ListUsersState extends Equatable {
  @override
  List<Object> get props => [];
}

class EmptyState extends ListUsersState {}

class LoadingState extends ListUsersState {}

class LoadedState extends ListUsersState {
  final List<User> users;

  LoadedState({@required this.users});
  @override
  List<Object> get props => [users];
}

class ErrorState extends ListUsersState {
  final String message;

  ErrorState({@required this.message});
  @override
  List<Object> get props => [message];
}
