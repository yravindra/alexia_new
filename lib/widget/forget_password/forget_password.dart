import 'package:alexia/controller/session_controller.dart';
import 'package:alexia/interface/services/profile_service.dart';
import 'package:alexia/routes/login.dart';
import 'package:alexia/utils/get_service.dart';
import 'package:alexia/utils/with_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../controller/router_controller.dart';
import '../../modules/theme.dart';
import '../screen/screen.dart';

class ForgetPassword extends StatelessWidget {
  final SessionController sessionController = Get.find();

  ForgetPassword({Key? key}) : super(key: key);

  final RouterController routerController = Get.find();

  _handleForgetPassword(BuildContext context) {
    return () async {
      if (!form.valid) {
        form.markAllAsTouched();
        return;
      }

      final sessionController = this.sessionController;

      final profileService = getService<ProfileService>();

      final result = await withSnackbar(
          context: context, callbackWithException: () async {});
    };
  }

  _handleLogin(BuildContext context) {
    return () {
      routerController.navigate(
        path: LoginRoute.ROUTE,
        replace: true,
      );
    };
  }

  final form = FormGroup(
    {
      'email': FormControl<String>(
        value: '',
        validators: [
          Validators.required,
          Validators.email,
        ],
      ),
    },
  );

  @override
  Widget build(BuildContext context) {
    return Screen(
      scroll: true,
      child: Container(
        height: MediaQuery.of(context).size.height - 100.h,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Text(
                  "Forgot Password?",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontSize: 34.sp,
                    letterSpacing: 4.5.sp,
                    color: titleColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Don't worry! it happens. Please enter the address associated with your account.",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontSize: 12.sp,
                    letterSpacing: 0.5.sp,
                    color: descriptionColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30.h),
                  child: ReactiveForm(
                    formGroup: form,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 12.h,
                          ),
                          child: ReactiveTextField(
                            decoration: const InputDecoration(
                              hintText: 'Enter Email Id',
                              border: OutlineInputBorder(),
                            ),
                            formControlName: 'email',
                            validationMessages: (control) => {
                              'required': 'The email must not be empty',
                              'email': 'The email value must be a valid email',
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 12.h,
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
                              'Submit',
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            onPressed: _handleForgetPassword(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 10,
              left: 120,
              child: InkWell(
                onTap: _handleLogin(context),
                child: Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Text(
                    "< Back to Login",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      fontSize: 12.sp,
                      letterSpacing: 0.5.sp,
                      color: titleColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
