//Flutter Import:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alexia/widget/add_visitor/upload_document.dart';
import 'package:alexia/widget/add_visitor/visitor_form.dart';


class AddVisitor extends StatelessWidget {
  AddVisitor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 30.h),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 45.h,
              ),
              padding: EdgeInsets.only(bottom: 20.h),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: VisitorForm(),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: UploadDocument(
                left: 0.w,
                right: 0.w,
                tag: "photo",
                title: "photo",
                key: const Key("photo"),
                height: 100.h,
                width: 100.w,
                circle: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
