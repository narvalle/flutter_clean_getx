import 'package:clean_project/core/error/failures.dart';

const String _SERVER_FAILURE_MESSAGE = 'Server Failure';
const String _CACHE_FAILURE_MESSAGE = 'Cache Failure';

String mapFailureMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return _SERVER_FAILURE_MESSAGE;
    case CacheFailure:
      return _CACHE_FAILURE_MESSAGE;
    default:
      return 'Unexpected error';
  }
}
