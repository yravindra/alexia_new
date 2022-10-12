//Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:alexia/interface/event_handler.dart';
import 'package:reactive_forms/reactive_forms.dart';

//Project imports:
import '../../controller/loading_controller.dart';
import '../../controller/session_controller.dart';
import '../../interface/services/profile_service.dart';
import '../../modules/theme.dart';
import '../../utils/get_service.dart';
import '../../utils/with_snackbar.dart';
import '../show_toast.dart';

class SwitchZone extends StatelessWidget {
  final SessionController sessionController = Get.find();
  final LoadingController loadingController = Get.put(
    LoadingController(),
    tag: "switch_zone",
  );

  RxBool checkIn = true.obs;
  final FormControl<String> _passwordController = FormControl();

  SwitchZone({Key? key}) : super(key: key);

  _handleCheckIn(bool status) {
    return () {
      checkIn.value = status;
      return;
    };
  }

  EventHandler _handleSetZone(BuildContext context) {
    return () async {
      if (_passwordController.value == null || _passwordController.value.toString().isEmpty ) {

        showToast(context,"Password can not be empty.");
        return;
      }

      final sessionController = this.sessionController;

      sessionController.setCheckType(checkIn.value ? "check_in" : "check_out");

      final profileService = getService<ProfileService>();

      String message = "";

      final zoneList = sessionController.zones;

      final zone = zoneList.firstWhereOrNull(
          (element) => element.name == sessionController.selectedZone);

      final zoneId = zone == null ? "" : zone.id;

      final result = await withSnackbar(
        context: context,
        callbackWithException: () async {
          message = await profileService.switchZone(
            token: sessionController.token,
            pinNumber: _passwordController.value.toString(),
            checkType: checkIn.value == true ? "check_in" : "check_out",
            zone: zoneId,
          );
        },
      );

      if (!result.successful) {
        return;
      }

      showToast(context,message);

      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    final checkInType = sessionController.checkInType;

    checkIn.value = checkInType == "check_in" ? true : false;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 40.h,
        horizontal: 15.w,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 10.w,
      ),
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        border: Border.all(
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20.h),
        ),
      ),
      child: SingleChildScrollView(
        child: Material(
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: Text(
                        "Switch Zone",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          fontSize: 18.sp,
                          letterSpacing: 0.5.sp,
                          color: titleColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        size: 30.h,
                      ),
                      onPressed: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Divider(
                height: 2,
                color: Colors.grey.withOpacity(0.5),
              ),
              SizedBox(height: 15.h),
              Text(
                "${sessionController.selectedZone} Selected",
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontSize: 14.sp,
                  letterSpacing: 0.5.sp,
                  color: titleColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 15.w,
                ),
                decoration: BoxDecoration(
                  color: accentColor,
                  border: Border.all(
                    color: accentColor,
                  ),
                  borderRadius: BorderRadius.circular(10.h),
                ),
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: _handleCheckIn(true),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 15.w,
                          ),
                          decoration: checkIn.value == true
                              ? BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(100.h),
                                )
                              : null,
                          child: Text(
                            "Check-In",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              fontSize: 14.sp,
                              letterSpacing: 0.5.sp,
                              color: checkIn.value == true
                                  ? titleColor
                                  : Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _handleCheckIn(false),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 15.w,
                          ),
                          decoration: checkIn.value == false
                              ? BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(100.h),
                                )
                              : null,
                          child: Text(
                            "Check-Out",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              fontSize: 14.sp,
                              letterSpacing: 0.5.sp,
                              color: checkIn.value == false
                                  ? titleColor
                                  : Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              ReactiveTextField<String>(
                formControl: _passwordController,
                textAlign: TextAlign.start,
                textInputAction: TextInputAction.done,
                obscureText: true,
                style: TextStyle(
                  color: descriptionColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                    labelText: 'Enter Pin',
                    labelStyle: TextStyle(
                      color: titleColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(color: navBarUnSelectedColor),
                    )),
              ),
              SizedBox(height: 15.h),
              Container(
                alignment: Alignment.bottomCenter,
                child: Obx(
                  () => loadingController.isLoading
                      ? SizedBox(
                          height: 20.w,
                          width: 20.w,
                          child: CircularProgressIndicator(
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.green),
                            strokeWidth: 3.w,
                          ),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: accentColor,
                            padding: EdgeInsets.symmetric(
                              horizontal: 100.w,
                              vertical: 12.h,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: Text(
                            'Set Zone',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          onPressed: loadingController
                              .withLoading(_handleSetZone(context)),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
