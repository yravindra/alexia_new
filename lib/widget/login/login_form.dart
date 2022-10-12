// Flutter imports:
import 'package:alexia/interface/services/profile_service.dart';
import 'package:alexia/routes/forget_password.dart';
import 'package:alexia/routes/profile.dart';
import 'package:alexia/utils/get_service.dart';
import 'package:alexia/utils/with_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import '../../controller/loading_controller.dart';
import '../../controller/router_controller.dart';
import '../../controller/session_controller.dart';
import '../../interface/event_handler.dart';
import '../../modules/theme.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);
  final LoadingController loadingController = Get.put(
    LoadingController(),
    tag: "login",
  );
  final SessionController sessionController = Get.find();
  final RouterController routerController = Get.find();

  final form = FormGroup(
    {
      'email': FormControl<String>(
        value: '',
        validators: [
          Validators.required,
          Validators.email,
        ],
      ),
      'pin': FormControl<String>(value: '', validators: [Validators.required]),
    },
  );

  EventHandler _handleLogin(BuildContext context, FormGroup form) {
    return () async {
      if (!form.valid) {
        form.markAllAsTouched();
        return;
      }

      final sessionController = this.sessionController;

      final profileService = getService<ProfileService>();

      final result = await withSnackbar(
          context: context,
          callbackWithException: () async {
            await sessionController.login(
              profileService: profileService,
              email: form.value["email"]?.toString().trim() ?? "",
              password: form.value["pin"]?.toString().trim() ?? "",
            );
          });

      if (!result.successful) {
        return;
      }

      return routerController.navigate(
        path: ProfileRoute.ROUTE,
        replace: true,
      );
    };
  }

  _handleForgetPassword(BuildContext context) {
    return () {
      routerController.navigate(
        path: ForgetPasswordRoute.ROUTE,
        replace: true,
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    formControlName: 'email',
                    validationMessages: (control) => {
                      'required': 'The email must not be empty',
                      'email': 'The email value must be a valid email',
                    },
                  ),
                ),
                ReactiveTextField(
                  decoration: const InputDecoration(
                    hintText: 'Enter Pin',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  formControlName: 'pin',
                  obscureText: true,
                  validationMessages: (control) => {
                    'required': 'The pin must not be empty',
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: _handleForgetPassword(context),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                      ),
                      child: Text(
                        "Forgot Password?",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          fontSize: 12.sp,
                          letterSpacing: 0.5.sp,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => loadingController.isLoading
                      ? SizedBox(
                          height: 20.w,
                          width: 20.w,
                          child: CircularProgressIndicator(
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.green,
                            ),
                            strokeWidth: 3.w,
                          ),
                        )
                      : Container(
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
                              'Login',
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            onPressed: loadingController.withLoading(
                              _handleLogin(context, form),
                            ),
                          ),
                        ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
