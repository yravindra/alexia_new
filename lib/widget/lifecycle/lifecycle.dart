// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/widgets.dart';

typedef LifecycleHandler = FutureOr<void> Function(BuildContext context);

class Lifecycle extends StatefulWidget {
  final Widget child;
  final LifecycleHandler? initState;
  final LifecycleHandler? deactivate;
  final LifecycleHandler? dispose;

  const Lifecycle({
    Key? key,
    required this.child,
    this.initState,
    this.deactivate,
    this.dispose,
  }) : super(key: key);

  @override
  _LifecycleState createState() => _LifecycleState();
}

class _LifecycleState extends State<Lifecycle> {
  @override
  void initState() {
    final initState = this.widget.initState;

    if (initState != null) {
      WidgetsBinding.instance!.addPostFrameCallback(
        (_) => initState(context),
      );
    }

    super.initState();
  }

  @override
  void deactivate() {
    final deactivate = widget.deactivate;

    if (deactivate != null) deactivate(context);

    super.deactivate();
  }

  @override
  void dispose() {
    final dispose = widget.dispose;

    if (dispose != null) dispose(context);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
