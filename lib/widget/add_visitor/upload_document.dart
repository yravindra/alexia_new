import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller/loading_controller.dart';
import '../../controller/session_controller.dart';
import '../../modules/theme.dart';

class UploadDocument extends StatelessWidget {
  final String tag, title;
  final double right, left, height, width;
  bool circle;
  final SessionController sessionController = Get.find();
  final LoadingController loadingController = Get.put(
    LoadingController(),
    tag: "Upload Image",
  );
  final url = "https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg";

  UploadDocument({
    Key? key,
    required this.tag,
    required this.title,
    required this.right,
    required this.left,
    required this.height,
    required this.width,
    this.circle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var pic = "";

        if (tag == "photo") {
          pic = sessionController.photoUrl;
        } else if (tag == "photoId") {
          pic = sessionController.photoIdUrl;
        } else {
          pic = sessionController.vaccineIdUrl;
        }

        final imageProvider = pic == ""
            ? NetworkImage(
                url,
              )
            : Image.file(
                File(pic ?? url),
                fit: BoxFit.cover,
              ).image;

        return GestureDetector(
          onTap: showImagePickerDialog(context, tag),
          child: Container(
            margin: EdgeInsets.only(right: right, left: left),
            decoration: circle
                ? BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  )
                : BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10.w),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 2,
                        color: const Color(0xff8a92de).withOpacity(0.1),
                      ),
                    ],
                  ),
            height: height,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontSize: 14.sp,
                    letterSpacing: 0.5.sp,
                    color: titleColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.add,
                  size: 30.h,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  showImagePickerDialog(BuildContext context, String type) {
    return () {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Container(
              color: Colors.white,
              child: Wrap(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: Text(
                      'Gallery',
                      style: TextStyle(
                        color: descriptionColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: loadingController.withLoading(
                      pickImage(ImageSource.gallery, context, type),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: Text(
                      'Camera',
                      style: TextStyle(
                        color: descriptionColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: loadingController.withLoading(
                      pickImage(ImageSource.camera, context, type),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    };
  }

  pickImage(ImageSource imageSource, BuildContext context, String type) {
    return () async {
      final ImagePicker _picker = ImagePicker();

      final xFile =
          await _picker.pickImage(source: imageSource, imageQuality: 60);

      if (xFile == null) {
        return;
      }

      String pic =  xFile.path;

      if (type == "photo") {
        return sessionController.setPhotoUrl(pic);
      }

      if (type == "photoId") {
        return sessionController.setPhotoIdUrl(pic);
      }

      if (type == "VaccineId") {
        return sessionController.setVaccineIdUrl(pic);
      }

      Navigator.of(context).pop();
    };
  }
}
