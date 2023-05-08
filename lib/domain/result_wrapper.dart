abstract class ResultWrapper {}

class ResultIdle extends ResultWrapper {}

class ResultLoading extends ResultWrapper {}

class ResultSuccess<T> extends ResultWrapper {
  final T result;

  ResultSuccess(this.result);
}

class ResultError extends ResultWrapper {
  final String errorMessage;

  ResultError(this.errorMessage);
}
