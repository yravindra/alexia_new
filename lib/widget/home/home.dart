// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

// Project imports:
import '../../controller/session_controller.dart';
import '../../interface/services/profile_service.dart';
import '../../modules/theme.dart';
import '../../utils/get_service.dart';
import '../../utils/with_snackbar.dart';
import '../../widget/screen/screen.dart';
import '../reports/reports.dart';
import '../show_toast.dart';
import 'main_screen.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final SessionController sessionController = Get.find();

  RxInt position = 0.obs;

  List<Widget> screens = [
    MainScreen(),
    Reports(),
   // AddVisitor(),
  ];

  _initState(BuildContext context) async {
    final profileService = getService<ProfileService>();

    final result = await withSnackbar(
      context: context,
      callbackWithException: () {
        return sessionController.verifySession(profileService: profileService);
      },
    );

    final isSessionVerified = result.value ?? false;

    requestPermission(Permission.camera);

    if (!isSessionVerified) {
      showToast(context, 'Session not verified, please logout and login again.');
    }
  }

  Future<void> requestPermission(Permission permission) async {
    final status = await permission.request();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: position.value,
      length: screens.length,
      child: Screen(
        initState: _initState,
        padding: EdgeInsets.zero,
        child: Stack(
          children: [
            TabBarView(
              children: screens,
            ),
            Positioned(
              bottom: 5.h,
              left: 1.w,
              right: 1.w,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      15.h,
                    ),
                  ),
                ),
                child: TabBar(
                  indicatorColor: Colors.transparent,
                  tabs: <Widget>[
                    Tab(
                      icon: Icon(
                        Icons.home,
                        size: 30.h,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.bar_chart_outlined,
                        size: 30.h,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.person_add,
                        size: 30.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
