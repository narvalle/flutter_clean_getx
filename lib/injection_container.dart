import 'package:clean_project/core/utils/http_manager.dart';
import 'package:clean_project/data/datasources/user_data_source.dart';
import 'package:clean_project/data/repositories/user_repository_impl.dart';
import 'package:clean_project/domain/repositories/user_repository.dart';
import 'package:clean_project/domain/usecases/user/get_user_from_id.dart';
import 'package:clean_project/domain/usecases/user/get_users.dart';
import 'package:clean_project/presentation/pages/list_users/list_users_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:clean_project/data/datasources/loca_configurations_data_source.dart';
import 'package:clean_project/data/datasources/number_trivia_data_source.dart';

import 'package:clean_project/data/repositories/local_configurations_repository_impl.dart';
import 'package:clean_project/data/repositories/number_trivia_repository_impl.dart';
import 'package:clean_project/domain/repositories/local_configurations_repository.dart';
import 'package:clean_project/domain/repositories/number_trivia_repository.dart';

import 'package:clean_project/domain/usecases/get_number_trivia_from_number.dart';
import 'package:clean_project/domain/usecases/get_number_trivia_random.dart';

import './presentation/bloc/number_trivia_bloc.dart';

final gi = GetIt.instance;

Future<void> init() async {
  //Bloc
  gi.registerFactory(
    () => NumberTriviaBloc(
      fromNumber: gi(),
      random: gi(),
    ),
  );

  gi.registerFactory(
    () => ListUsersBloc(
      users: gi(),
    ),
  );

  //Use Cases
  gi.registerLazySingleton(() => GetNumberTriviaFromNumber(gi()));
  gi.registerLazySingleton(() => GetNumberTriviaRandom(gi()));
  //users
  gi.registerLazySingleton(() => GetUsers(gi()));
  gi.registerLazySingleton(() => GetUserFromId(gi()));

  //Repositories
  gi.registerLazySingleton<NumberTriviaRepository>(
    () => NumberTriviaRepositoryImpl(
      dataSource: gi(),
    ),
  );

  gi.registerLazySingleton<LocalConfigurationsRepository>(
    () => LocalConfigurationsRepositoryImpl(
      localDataSource: gi(),
    ),
  );

  gi.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      dataSource: gi(),
    ),
  );

  gi.registerLazySingleton<HttpManager>(
    () => HttpManagerImpl(
      repository: gi(),
    ),
  );

  //Data Sources
  gi.registerLazySingleton<NumberTriviaDataSource>(
    () => NumberTriviaDataSourceImpl(
      httpManager: gi(),
    ),
  );

  gi.registerLazySingleton<UserDataSource>(
    () => UserDataSourceImpl(
      httpManager: gi(),
    ),
  );

  gi.registerLazySingleton<LocalConfigurationsDataSource>(
    () => LocalConfigurationsDataSourceImpl(
      globalConfiguration: gi(),
    ),
  );

  //Core

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  gi.registerLazySingleton(
    () => sharedPreferences,
  );
  gi.registerLazySingleton(
    () => http.Client(),
  );
  gi.registerLazySingleton(
    () => GlobalConfiguration(),
  );
}
