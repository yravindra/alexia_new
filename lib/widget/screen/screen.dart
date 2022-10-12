// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';


// Project imports:
import '../lifecycle/lifecycle.dart';

class Screen extends StatelessWidget {
  final Widget? header;
  final Widget child;
  final bool createSafeArea;
  final LifecycleHandler? initState;
  final LifecycleHandler? dispose;
  final LifecycleHandler? deactivate;
  final EdgeInsets padding;
  final bool scroll;
  final SystemUiOverlayStyle overlayStyle;

  Screen({
    Key? key,
    required this.child,
    this.header,
    this.createSafeArea = true,
    this.initState,
    this.dispose,
    this.deactivate,
    this.scroll = false,
    SystemUiOverlayStyle? overlayStyle,
    EdgeInsets? padding,
  })  : padding = padding ?? EdgeInsets.symmetric(horizontal: 16.w),
        overlayStyle = overlayStyle ??
            SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: Colors.white,
            ),
        super(key: key);

  Widget _withPadding(Widget child) {
    return Padding(
      padding: padding,
      child: child,
    );
  }

  Widget _withHeader(Widget child) {
    if (header == null) return child;

    return Column(
      children: [
        header as Widget,
        scroll ? child : Expanded(child: child),
      ],
    );
  }

  Widget _withScroll(Widget child) {
    if (!scroll) return child;

    return SingleChildScrollView(child: child);
  }

  Widget _withSafeArea(Widget child) {
    if (!createSafeArea) return child;

    return SafeArea(child: child);
  }

  Widget _widthAnnotatedRegion(Widget child) {
    return AnnotatedRegion(
      value: overlayStyle,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Lifecycle(
      child: _widthAnnotatedRegion(
        _withSafeArea(
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: _withScroll(
              _withHeader(
                _withPadding(child),
              ),
            ),
          ),
        ),
      ),
      initState: initState,
      dispose: dispose,
      deactivate: deactivate,
    );
  }
}
