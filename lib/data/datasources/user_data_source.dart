import 'package:clean_project/core/utils/http_manager.dart';
import 'package:clean_project/data/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';

abstract class UserDataSource {
  Future<List<User>> getUsers();
  Future<User> getUserFromId(int id);
}

class UserDataSourceImpl implements UserDataSource {
  final HttpManager httpManager;
  final String _path = 'users';

  UserDataSourceImpl({@required this.httpManager});

  @override
  Future<User> getUserFromId(int id) async => UserModel.fromJsonMap(
        await httpManager.get(path: '$_path/$id'),
      );

  @override
  Future<List<User>> getUsers() async =>
      (await httpManager.get(path: _path) as List)
          .map(
            (map) => UserModel.fromJsonMap(map),
          )
          .toList();
}
