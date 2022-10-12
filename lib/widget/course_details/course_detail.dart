import 'package:alexia/main.dart';
import 'package:alexia/modules/theme.dart';
import 'package:alexia/widget/mainpage/main_headers.dart';
import 'package:alexia/widget/screen/screen.dart';
import 'package:alexia/widget/small_app_bar/small_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final form = FormGroup({
      'CourseName': FormControl<String>(validators: [Validators.required]),
      'CourseContent': FormControl<String>(validators: [Validators.required]),
      'Duration': FormControl<String>(validators: [Validators.required]),
      'CourseSchedule': FormControl<String>(validators: [Validators.required]),
      'CoursePrice': FormControl<String>(validators: [Validators.required]),
      'CourseLink': FormControl<String>(validators: [Validators.required]),
      'GroupClass': FormControl<int>(validators: [Validators.required]),
    });

    return Screen(
      scroll: true,
      header: AppBar(
        title: Text('Hello Richard'),
        backgroundColor: primaryColor,
      ),
      padding: EdgeInsets.zero,
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
                          hintText: " Course Name",
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorStyle: TextStyle(color: primaryColor)
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.all(Radius.zero),
                          // ),
                          ),
                      formControlName: 'CourseName',
                      validationMessages: (control) => {
                        'required': 'Field cant be empty',
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Material(
                    elevation: 5,
                    shadowColor: Colors.grey,
                    child: ReactiveTextField(
                      minLines: 3,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: ' Course Description',
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      formControlName: 'CourseContent',
                      validationMessages: (control) => {
                        'required': 'Field cant be empty',
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Material(
                    elevation: 5,
                    shadowColor: Colors.grey,
                    child: ReactiveDropdownField(
                      items:  [
                        DropdownMenuItem(value: 0, child: Text("Student")),
                        DropdownMenuItem(value: 1, child: Text("Group")),
                      ],
                      decoration: const InputDecoration(
                        hintText: ' Class for',
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.zero)),
                      ),
                      formControlName: "GroupClass",
                      validationMessages: (control) => {
                        'required': 'Field cant be empty',
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Material(
                    elevation: 5,
                    shadowColor: Colors.grey,
                    borderRadius: BorderRadius.circular(0.0),
                    child: ReactiveTextField(
                      decoration: const InputDecoration(
                        hintText: " Duration",
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      formControlName: 'Duration',
                      validationMessages: (control) => {
                        'required': 'Field cant be empty',
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Material(
                    elevation: 5,
                    shadowColor: Colors.grey,
                    child: ReactiveTextField(
                      decoration: const InputDecoration(
                        hintText: " Course link (zoom, google meet)",
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      formControlName: 'CourseLink',
                      validationMessages: (control) => {
                        'required': 'Field cant be empty',
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Material(
                    elevation: 5,
                    shadowColor: Colors.grey,
                    child: ReactiveTextField(
                      decoration: const InputDecoration(
                        hintText: " Course Schedule",
                        suffixIcon: Icon(Icons.calendar_month),
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      formControlName: 'CourseSchedule',
                      validationMessages: (control) => {
                        'required': 'Field cant be empty',
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Material(
                    elevation: 5,
                    shadowColor: Colors.grey,
                    child: ReactiveTextField(
                      decoration: const InputDecoration(
                        hintText: " 500",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      formControlName: 'CoursePrice',
                      validationMessages: (control) => {
                        'required': 'Field cant be empty',
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 12.w,
                    ),
                    width: double.infinity,
                    child: ElevatedButton(
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
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
