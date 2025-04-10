abstract class BaseCubitStatus {}

class InitialStatus extends BaseCubitStatus {
  InitialStatus();
}

class LoadingStatus extends BaseCubitStatus {
  final bool isLoading;

  LoadingStatus({this.isLoading = true});
}

class LoadedStatus<T> extends BaseCubitStatus {
  final String? event;

  LoadedStatus({this.event});
}

class SubmittingStatus extends BaseCubitStatus {
  final String? event;

  SubmittingStatus({this.event});
}

class SubmittedStatus<T> extends BaseCubitStatus {
  final String? event;
  final T? data;

  SubmittedStatus({this.event, this.data});
}

class ErrorStatus extends BaseCubitStatus {
  final String message;
  final String? event;
  final Exception? exception;

  ErrorStatus({this.message = 'An error occurred', this.event, this.exception});
}

class SuccessStatus extends BaseCubitStatus {
  final String message;

  SuccessStatus({this.message = 'Success'});
}

mixin CubitStatus {
  static InitialStatus initial() => InitialStatus();
  static LoadingStatus loading({bool isLoading = true}) =>
      LoadingStatus(isLoading: isLoading);
  static LoadedStatus loaded({String? event}) => LoadedStatus(event: event);
  static SubmittingStatus submitting({String? event}) =>
      SubmittingStatus(event: event);
  static SubmittedStatus<T> submitted<T>({String? event, T? data}) =>
      SubmittedStatus(event: event, data: data);
  static ErrorStatus error({
    String message = 'An error occurred',
    String? event,
    Exception? exception,
  }) => ErrorStatus(message: message, event: event, exception: exception);
  static SuccessStatus success({String message = 'Success'}) =>
      SuccessStatus(message: message);
}
