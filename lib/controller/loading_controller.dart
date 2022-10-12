// Package imports:
import 'package:get/get.dart';


// Project imports:
import '../interface/event_handler.dart';
import '../utils/get_logger.dart';

class LoadingController extends GetxController {
  final RxBool _loading = false.obs;

  LoadingController({bool initialLoading = false}) {
    this._loading.value = initialLoading;
  }

  bool get isLoading => this._loading.value;

  void _logThis() {
    final logger = getLogger();

    logger.d({
      "loading": this._loading.value,
    });
  }

  void startLoading() {
    this._loading.value = true;

    this._logThis();
  }

  void stopLoading() {
    this._loading.value = false;

    this._logThis();
  }

  EventHandler withLoading(EventHandler handler) {
    return () async {
      final logger = getLogger();

      logger.d({"handler": handler.toString()});

      if (this.isLoading) {
        return;
      }

      startLoading();

      await handler();

      stopLoading();
    };
  }
}
