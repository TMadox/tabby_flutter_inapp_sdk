import 'package:api_request/api_request.dart';

extension ApiActionExtensions<T> on ApiRequestAction<T> {
  Future<T> customExcution(
    bool showLoadings, {
    Function? onStart,
    dynamic Function(T?)? onSuccess,
    dynamic Function(ActionRequestError<dynamic>)? onError,
    Function? onDone,
  }) async =>
      listen(
        onStart: () {
          if (onStart != null) {
            onStart();
          }
        },
        onSuccess: (response) => onSuccess != null ? onSuccess(response) : null,
        onError: (error) {
          if (onError != null) {
            onError(error);
          }
        },
        onDone: () {
          if (onDone != null) {
            onDone();
          }
        },
      ).execute().then<T>(
            (value) => value!.fold(
              (error) => throw Exception(error?.message ?? error?.error),
              (response) => response,
            ),
          );
}
