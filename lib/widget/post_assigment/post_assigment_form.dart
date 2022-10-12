import 'package:alexia/modules/theme.dart';
import 'package:alexia/widget/mainpage/main_headers.dart';
import 'package:alexia/widget/screen/screen.dart';
import 'package:alexia/widget/small_app_bar/small_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PostAssigmentForm extends StatelessWidget {
  PostAssigmentForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final form = FormGroup({
      'AssignmentName': FormControl<String>(validators: [Validators.required]),
      'AssignmentDescription':
          FormControl<String>(validators: [Validators.required]),
      'Maths': FormControl<String>(validators: [Validators.required]),
      'UploadRelatedDoc':
          FormControl<String>(validators: [Validators.required]),
      'SubmissionDate': FormControl<String>(validators: [Validators.required]),
    });
    return Screen(
        child: Column(
      children: [
        MainHeader(),
        Container(
          color: const Color(0x00f8f0e3),
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: ReactiveForm(
            formGroup: form,
            child: Column(
              children: [
                Material(
                  elevation: 5,
                  shadowColor: Colors.grey,
                  child: ReactiveTextField(
                    decoration: const InputDecoration(
                      hintText: " Assignment Name",
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.all(Radius.zero),
                      // ),
                    ),
                    formControlName: 'AssignmentName',
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Material(
                  elevation: 5,
                  shadowColor: Colors.grey,
                  child: ReactiveTextField(
                    minLines: 3,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      hintText: ' Assignment Description',
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    formControlName: 'AssignmentDescription',
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Material(
                  elevation: 5,
                  shadowColor: Colors.grey,
                  child: ReactiveDropdownField(
                    items: [],
                    decoration: const InputDecoration(
                      hintText: 'Maths',
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.zero)),
                    ),
                    formControlName: "Maths",
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Material(
                  elevation: 5,
                  shadowColor: Colors.grey,
                  child: ReactiveTextField(
                    decoration: const InputDecoration(
                      hintText: "Upload Related Doc",
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    formControlName: 'UploadRelatedDoc',
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Material(
                  elevation: 5,
                  shadowColor: Colors.grey,
                  child: ReactiveTextField(
                    decoration: const InputDecoration(
                      hintText: "Submission Date",
                      suffixIcon: Icon(Icons.calendar_month),
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    formControlName: 'SubmissionDate',
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height: 30.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    elevation: 5,
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 10.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Publish',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
