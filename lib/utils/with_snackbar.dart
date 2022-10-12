// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'app_exception.dart';

typedef CallbackWithException<T> = Future<T> Function();

class SafeReturn<T> {
  T? value;
  bool successful;
  Exception? e;

  SafeReturn({
    this.value,
    required this.successful,
    this.e,
  });
}

Future<SafeReturn<T>> withSnackbar<T>({
  required CallbackWithException<T> callbackWithException,
  required BuildContext context,
  Key? key,
}) async {
  String message = "";

  Exception _e;

  try {
    final value = await callbackWithException();

    return SafeReturn(
      value: value,
      successful: true,
      e: null,
    );
  } on UnauthorisedException catch (e) {
    message = e.message;
    _e = e;
  } on NotFoundException catch (e) {
    message = e.message;
    _e = e;
  } on ValidationException catch (e) {
    message = e.message;
    _e = e;
  } on Exception catch (e) {
    // todo revert to something went wrong
    // message = "Something went wrong";
    message = e.toString();
    _e = e;
  }

  if (message != "") {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        key: key,
        content: Text(message),
        backgroundColor: Theme.of(context).errorColor,
      ),
    );
  }

  return SafeReturn(
    value: null,
    successful: false,
    e: _e,
  );
}
