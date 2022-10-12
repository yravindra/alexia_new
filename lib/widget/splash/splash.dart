// Flutter imports:
import 'package:alexia/routes/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:alexia/routes/home.dart';
import 'package:alexia/routes/login.dart';

// Project imports:

import '../../controller/router_controller.dart';
import '../../controller/session_controller.dart';
import '../../interface/services/profile_service.dart';
import '../../routes/intro.dart';
import '../../utils/get_service.dart';
import '../../widget/screen/screen.dart';
import 'splash_background.dart';
import 'splash_title.dart';

class Splash extends StatelessWidget {
  final RouterController routerController = Get.find();
  final SessionController sessionController = Get.find();

  Splash({Key? key}) : super(key: key);

  Future loginAndRedirect(BuildContext context) async {
    final sessionController = this.sessionController;
    await sessionController.loadFromStorage();

    if (sessionController.token.isEmpty) {
      return routerController.navigate(
        path: IntroRoute.ROUTE,
        replace: true,
      );
    }

    // final profileService = getService<ProfileService>();
    //
    // await sessionController.verifySession(profileService: profileService);

    return routerController.navigate(
      path: ProfileRoute.ROUTE,
      replace: true,
    );
  }

  _initState(BuildContext context) async {
    Future.delayed(const Duration(milliseconds: 500), () {
      return loginAndRedirect(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      initState: _initState,
      createSafeArea: false,
      overlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: SplashBackground(
        child: Stack(
          fit: StackFit.expand,
          children: [
            ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.4),
                    Colors.white.withOpacity(0.05),
                  ],
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              child: Container(),
            ),
            const Center(child: SplashTitle()),
          ],
        ),
      ),
    );
  }
}
