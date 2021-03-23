import 'package:clean_project/core/error/failures.dart';
import 'package:clean_project/core/usecases/usecase.dart';
import 'package:clean_project/domain/entities/user.dart';
import 'package:clean_project/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class GetUsers extends UseCase<List<User>, NoParams> {
  final UserRepository repository;

  GetUsers(this.repository);

  @override
  Future<Either<Failure, List<User>>> call(NoParams params) async =>
      await repository.getUsers();
}
