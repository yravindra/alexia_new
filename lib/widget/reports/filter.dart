import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:alexia/controller/session_controller.dart';
import 'package:alexia/interface/services/report_service.dart';
import 'package:alexia/interface/zones.dart';
import 'package:alexia/utils/get_service.dart';
import 'package:alexia/widget/lifecycle/lifecycle.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';

import '../../modules/theme.dart';

class Filter extends StatelessWidget {
  Color borderColor;
  final double borderRadius;
  final Widget? prefixIcon;
  final SessionController sessionController = Get.find();
  late final List<String> item;
  late List<String> dates;
  late List<String> formattedDates;

  Filter({
    Key? key,
    this.borderColor = const Color(0xff778088),
    this.borderRadius = 5.0,
    this.prefixIcon,
  }) : super(key: key);

  Future<List<String>> _getFilterDates() async {
    final reportsService = getService<ReportService>();

    final sc = sessionController;

    final token = sc.token;

    final filterDates = await reportsService.getFilterDates(
      token: token,
    );

    return filterDates;
  }

  OutlineInputBorder _outlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: borderColor.withOpacity(0.6), width: 1.0),
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  void _handleGateSelection(String? value) {
    final sessionController = this.sessionController;

    sessionController.setSelectedFilterGate(value ?? "");
  }

  FutureOr<void> _initState(BuildContext context) {
    sessionController.setSelectedFilterGate(item[0]);
  }

  Widget _buildDateFilter(
    BuildContext context,
    AsyncSnapshot<List<String>> snapshot,
  ) {
    dates = snapshot.data ?? [];
    formattedDates = [];

    for (final date in dates) {
      DateTime now = DateTime.parse(date);
      String formattedDate = DateFormat('dd MMM yyyy').format(now);

      formattedDates.add(formattedDate);
    }

    return Visibility(
      visible: dates.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.h),
          Text(
            "Select date",
            textScaleFactor: 1.0,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 12.sp,
              letterSpacing: 0.5.sp,
              color: descriptionColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.h),
          DropdownSearch<String>(
            clearButtonProps: ClearButtonProps(
              isVisible: true,
              icon: Icon(
                Icons.clear,
                size: 15.w,
              ),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Select Date To Filter",
                hintText: "Select Date",
                fillColor: Theme.of(context).backgroundColor,
                floatingLabelStyle: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                labelStyle: TextStyle(
                  color: descriptionColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                focusedBorder: _outlineInputBorder(),
                border: _outlineInputBorder(),
                enabledBorder: _outlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10.h),
                prefixIcon: prefixIcon,
              ),
            ),
            items: formattedDates,
            onChanged: _handleDateSelection,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Zones> zones = sessionController.zones;

    item = zones.map((zone) => zone.name).toList();

    final selectedItem = item == [] ? "" : item[0];

    return Lifecycle(
      initState: _initState,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select gate",
              textScaleFactor: 1.0,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 12.sp,
                letterSpacing: 0.5.sp,
                color: descriptionColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.h),
            DropdownSearch<String>(
              clearButtonProps: ClearButtonProps(
                isVisible: true,
                icon: Icon(
                  Icons.clear,
                  size: 15.w,
                ),
              ),
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "",
                  fillColor: Theme.of(context).backgroundColor,
                  floatingLabelStyle: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  labelStyle: TextStyle(
                    color: descriptionColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  focusedBorder: _outlineInputBorder(),
                  border: _outlineInputBorder(),
                  enabledBorder: _outlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.h),
                  prefixIcon: prefixIcon,
                ),
              ),
              items: item,
              onChanged: _handleGateSelection,
              selectedItem: selectedItem,
            ),
            FutureBuilder<List<String>>(
              future: _getFilterDates(),
              builder: _buildDateFilter,
            ),
          ],
        ),
      ),
    );
  }

  _handleDateSelection(String? pickedDate) {
    if (pickedDate != null) {
      final pos = formattedDates.indexWhere((element) => element == pickedDate);

      final selectedDate = dates[pos];

      sessionController.setSelectedFilterDate(selectedDate);
    } else {
      sessionController.setSelectedFilterDate("");
    }
  }
}
