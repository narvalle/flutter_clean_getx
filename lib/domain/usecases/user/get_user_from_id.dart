import 'package:clean_project/core/error/failures.dart';
import 'package:clean_project/core/usecases/usecase.dart';
import 'package:clean_project/domain/entities/user.dart';
import 'package:clean_project/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class GetUserFromId implements UseCase<User, Params> {
  final UserRepository repository;

  GetUserFromId(this.repository);

  @override
  Future<Either<Failure, User>> call(Params params) async =>
      await repository.getUserFromId(params.id);
}

class Params extends Equatable {
  final int id;

  Params({@required this.id});

  @override
  List<Object> get props => [id];
}
