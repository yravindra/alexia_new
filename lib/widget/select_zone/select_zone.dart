//Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//Project imports:
import '../../controller/session_controller.dart';
import '../../modules/theme.dart';

class SelectZone extends StatelessWidget {
  final SessionController sessionController = Get.find();

  SelectZone({Key? key}) : super(key: key);

  Widget _buildZoneOption(int index) {
    final sessionController = this.sessionController;

    final selectedZone = this.sessionController.selectedZone;

    final zones = sessionController.zones;

    final zone = zones[index];

    return GestureDetector(
      onTap: () {
        sessionController.setSelectedZone(zone.name);
      },
      child: Container(
        margin: EdgeInsets.only(top: 15.h),
        decoration: BoxDecoration(
          color: accentColor,
          border: Border.all(
            width: 1,
            color: accentColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20.h),
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 10.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.location_on,
              size: 30.h,
              color: Colors.white,
            ),
            Text(
              zone.name,
              textScaleFactor: 1.0,
              style: TextStyle(
                fontSize: 18.sp,
                letterSpacing: 0.5.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: selectedZone == zone.name
                    ? Colors.white
                    : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: selectedZone == zone.name ? 4.5 : 2.5,
                ),
              ),
              child: const Center(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
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
                          "Select Zone",
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
                Container(
                  margin: EdgeInsets.only(
                    top: 12.h,
                    bottom: 16.h,
                  ),
                  padding: EdgeInsets.all(4.w),
                  width: 500.h,
                  child: Column(
                    children: List.generate(
                      sessionController.zones.length,
                      _buildZoneOption,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
