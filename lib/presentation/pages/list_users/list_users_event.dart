import 'package:equatable/equatable.dart';

abstract class ListUsersEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetUsersEvent extends ListUsersEvent {}
