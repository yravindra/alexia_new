//Import Flutter:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:alexia/widget/add_visitor/upload_document.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';
import 'package:reactive_forms/reactive_forms.dart';

//Import Project:
import '../../controller/loading_controller.dart';
import '../../controller/session_controller.dart';
import '../../interface/event_handler.dart';
import '../../interface/option.dart';
import '../../interface/services/scan_service.dart';
import '../../modules/theme.dart';
import '../../utils/get_service.dart';
import '../../utils/with_snackbar.dart';
import '../form_field/option_dropdown.dart';
import '../show_toast.dart';

class VisitorForm extends StatelessWidget {
  final SessionController sessionController = Get.find();

  final LoadingController loadingADDController = Get.put(
    LoadingController(),
    tag: "ADD",
  );

  FormGroup buildForm() => fb.group(DEFAULT_FORM_VALUE);

  VisitorForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = sessionController.categories;
    final docsType = sessionController.docsType;

    return ReactiveFormBuilder(
      form: buildForm,
      builder: (context, form, child) {
        return Column(
          children: <Widget>[
            SizedBox(height: 50.h),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 12.h,
              ),
              child: OptionDropdown(
                formControlName: 'category',
                dialogMode: Mode.MENU,
                optionList: categories as List<Option>,
                label: 'Category',
                showClearButton: true,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 12.h,
              ),
              child: ReactiveTextField(
                decoration: const InputDecoration(
                  hintText: 'Enter Name',
                  border: OutlineInputBorder(),
                ),
                formControlName: 'name',
                validationMessages: (control) =>
                    {'required': 'The name must not be empty'},
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10.w,
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
                horizontal: 10.w,
                vertical: 12.h,
              ),
              child: ReactiveTextField(
                decoration: const InputDecoration(
                  hintText: 'Enter Mobile Number',
                  border: OutlineInputBorder(),
                ),
                formControlName: 'mobile',
                validationMessages: (control) => {
                  'required': 'The mobile must not be empty',
                  'minLenght': 'The mobile value must be a valid mobile',
                  'maxLenght': 'The mobile value must be a valid mobile'
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 12.h,
              ),
              child: ReactiveTextField(
                decoration: const InputDecoration(
                  hintText: 'Company Name',
                  border: OutlineInputBorder(),
                ),
                formControlName: 'company',
                validationMessages: (control) =>
                    {'required': 'The company name must not be empty'},
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 12.h,
              ),
              child: ReactiveTextField(
                decoration: const InputDecoration(
                  hintText: 'Designation',
                  border: OutlineInputBorder(),
                ),
                formControlName: 'designation',
                validationMessages: (control) => {
                  'required': 'The designation must not be empty',
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 12.h,
              ),
              child: OptionDropdown(
                formControlName: 'idProof',
                dialogMode: Mode.MENU,
                optionList: docsType as List<Option>,
                label: 'Id Proof',
                showClearButton: true,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 12.h,
              ),
              child: ReactiveTextField(
                decoration: const InputDecoration(
                  hintText: 'Id Proof Number',
                  border: OutlineInputBorder(),
                ),
                formControlName: 'idProofNo',
                validationMessages: (control) => {
                  'required': 'The Id Proof Number must not be empty',
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(
                    "Is visitor vaccinated",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      fontSize: 14.sp,
                      letterSpacing: 0.5.sp,
                      color: descriptionColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ReactiveSwitch(
                  formControlName: "isVc",
                  activeColor: accentColor,
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UploadDocument(
                  left: 10.w,
                  right: 0,
                  tag: "photoId",
                  title: "Photo Id",
                  key: const Key("photoId"),
                  height: 120.h,
                  width: 150.w,
                ),
                UploadDocument(
                  left: 0,
                  right: 10.w,
                  tag: "VaccineId",
                  title: "Vaccine Certificate",
                  key: const Key("VaccineId"),
                  height: 120.h,
                  width: 150.w,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Obx(
              () => loadingADDController.isLoading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.w,
                          width: 20.w,
                          child: CircularProgressIndicator(
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.green),
                            strokeWidth: 3.w,
                          ),
                        ),
                      ],
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: accentColor,
                        padding: EdgeInsets.symmetric(
                          horizontal: 100.w,
                          vertical: 12.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Add Visitor',
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      onPressed: loadingADDController.withLoading(
                        _handleAddVisitor(context, form),
                      ),
                    ),
            ),
            SizedBox(height: 80.h),
          ],
        );
      },
    );
  }

  EventHandler _handleAddVisitor(BuildContext context, FormGroup form) {
    return () async {
      if (!form.valid) {
        form.markAllAsTouched();
        return;
      }

      final token = sessionController.token;

      final String? photo = sessionController.photoUrl;

      if(photo == null){
        showToast(context,"Profile pic is mandatory");
        return;
      }

      final String? photoIdFile = sessionController.photoIdUrl;
      final String? vaccineFile = sessionController.vaccineIdUrl;

      final scanService = getService<ScanService>();

      final category = (form.value["category"] as Option?);

      final mobile = form.value["mobile"].toString();

      final idProof = (form.value["idProof"] as Option?);

      final isVc = (form.value["isVc"] as bool?);

      var vaccinated = "Y";

      if (isVc == null || isVc == false) {
        vaccinated = "N";
      }

      final result = await withSnackbar(
        context: context,
        callbackWithException: () => scanService.addVisitor(
          name: form.value["name"] == null ? "" : form.value["name"].toString(),
          email: form.value["email"] == null ? "" : form.value["email"].toString(),
          mobile: mobile,
          source: "offline",
          category: category?.shortName ?? "",
          company: form.value["company"] == null ? "" : form.value["company"].toString(),
          designation: form.value["designation"] == null ? "" : form.value["designation"].toString(),
          photoIdType: idProof?.catName ?? "PAN CARD",
          photoIdValue: form.value["idProofNo"] == null ? "" : form.value["idProofNo"].toString(),
          photo: photo,
          photoIdFile: photoIdFile,
          token: token,
          vaccineFile: vaccineFile,
          isVc: vaccinated,
        ),
      );

      if (!result.successful) {
        return;
      }

      form.reset();

      sessionController.setVaccineIdUrl("");
      sessionController.setPhotoIdUrl("");
      sessionController.setPhotoUrl("");

      showToast(context, result.value ?? "");
    };
  }

  final DEFAULT_FORM_VALUE = <String, Object>{
    'name': FormControl<String>(value: '', validators: [Validators.required]),
    'company':
        FormControl<String>(value: '', validators: [Validators.required]),
    'idProofNo': FormControl<String>(value: ''),
    'email': FormControl<String>(value: '', validators: [
      Validators.email,
    ]),
    'mobile': FormControl<String>(value: ''),
    'designation': FormControl<String>(value: '', validators: [Validators.required]),
    'category': FormControl<Option>(value: null),
    'idProof': FormControl<Option>(value: null),
    'isVc': FormControl<bool>(value: null),
  };
}
