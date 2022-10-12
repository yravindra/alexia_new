// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:collection/collection.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Project imports:
import '../../controller/router_controller.dart';
import 'navitem.dart';

class NavigationBar extends StatelessWidget {
  final RouterController routerController = Get.find();
  final List<NavItem> items;
  final double? elevation;
  final BottomNavigationBarType? type;
  final Color? backgroundColor;
  final double iconSize;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;
  final double? labelFontSize;

  NavigationBar({
    Key? key,
    required this.items,
    this.elevation,
    this.type,
    this.backgroundColor,
    this.iconSize = 20.0,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.labelFontSize,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
  }) : super(key: key);

  NavItem? get activeItem {
    final controller = routerController;

    final activeItem = items.firstWhereOrNull(
      (element) {
        return controller.isCurrent(
          pathTemplate: element.route,
          prefix: true,
        );
      },
    );

    return activeItem;
  }

  VoidCallback _handleTap(NavItem clickedItem) {
    return () {
      final controller = routerController;

      final isActive = controller.isCurrent(
        path: clickedItem.route,
        prefix: true,
      );

      if (isActive) return;

      routerController.navigate(
            path: clickedItem.route,
            clearStack: true,
          );
    };
  }

  List<Widget> _buildItems() {
    final activeItem = this.activeItem;

    final List<Widget> navItems = [];

    for (int i = 0, iL = items.length; i < iL; i += 1) {
      final item = items[i];

      final label = item.label;

      final icon = item.icon;

      final isActive = activeItem == item;

      navItems.add(
        Flexible(
          flex: 1,
          child: NavBarItem(
            onPressed: _handleTap(item),
            active: isActive,
            label: label,
            selectedItemColor: selectedItemColor,
            unselectedItemColor: unselectedItemColor,
            icon: icon,
            size: iconSize.w,
          ),
        ),
      );
    }

    return navItems;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final controller = routerController;

        final activeRoute = controller.getActiveRoute();

        final navbarVisible = activeRoute.navbarVisible;

        final double additionalBottomPadding =
            MediaQuery.of(context).padding.bottom;

        return Visibility(
          visible: navbarVisible,
          child: Material(
            elevation: elevation ?? 8.0,
            color: backgroundColor,
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: additionalBottomPadding,
                ),
                child: DefaultTextStyle.merge(
                  overflow: TextOverflow.ellipsis,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: _buildItems(),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
