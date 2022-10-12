//Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//Project imports:
import 'package:alexia/modules/theme.dart';

import '../../controller/tab_group_obs_controller.dart';

class DateTab extends StatelessWidget {
  final TabGroupObsController tabController = Get.find();

  DateTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(
        () {
          final value = tabController.getValue();

          return Row(
            children: [
              for (int i = 0; i < 8; i++)
                InkWell(
                  onTap: () {
                    tabController.setValue("Tab $i");
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10.w),
                    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                    decoration: BoxDecoration(
                      color: value == "Tab $i" ? accentColor : Colors.transparent,
                      border: Border.all(
                        color: accentColor,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20.h)),
                    ),
                    child: Center(
                      child: Text(
                        "Tab $i",
                        textScaleFactor: 1.0,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 14.sp,
                          letterSpacing: 0.5.sp,
                          color: value == "Tab $i"
                              ? Colors.white
                              : descriptionColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
