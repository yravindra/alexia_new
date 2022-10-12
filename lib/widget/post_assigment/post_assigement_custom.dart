import 'package:alexia/widget/extra_class/extra_class_custom.dart';
import 'package:alexia/widget/post_assigment/post_assigment.dart';
import 'package:alexia/widget/student_assignments/student_assignments_custom.dart';
import 'package:flutter/material.dart';

class PostAssigmentCustom extends StatelessWidget {
  const PostAssigmentCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: const [

          PostAssigment(
              textHeader: "Assignment Name",
              textDesciption: "Assignment short discription",
              textDate: "Submission Date : ",
              icon: ImageIcon(
                AssetImage("assets/assigmentname.png"),
                size: 24,
              )),
          PostAssigment(
              textHeader: "Assignment Name",
              textDesciption: "Assignment short discription",
              textDate: "Submission Date : ",
              icon: ImageIcon(
                AssetImage("assets/postsubmission.png"),
                size: 24,
              )),
          PostAssigment(
              textHeader: "Assignment Name",
              textDesciption: "Assignment short discription",
              textDate: "Submission Date : ",
              icon: ImageIcon(
                AssetImage("assets/postsubmission.png"),
                size: 24,
              )),
          PostAssigment(
              textHeader: "Assignment Name",
              textDesciption: "Assignment short discription",
              textDate: "Submission Date : ",
              icon: ImageIcon(
                AssetImage("assets/postsubmission.png"),
                size: 24,
              )),
          PostAssigment(
              textHeader: "Assignment Name",
              textDesciption: "Assignment short discription",
              textDate: "Submission Date : ",
              icon: ImageIcon(
                AssetImage("assets/postsubmission.png"),
                size: 24,
              )),
          PostAssigment(
              textHeader: "Assignment Name",
              textDesciption: "Assignment short discription",
              textDate: "Submission Date : ",
              icon: ImageIcon(
                AssetImage("assets/postsubmission.png"),
                size: 24,
              )),
          PostAssigment(
              textHeader: "Assignment Name",
              textDesciption: "Assignment short discription",
              textDate: "Submission Date : ",
              icon: ImageIcon(
                AssetImage("assets/postsubmission.png"),
                size: 24,
              )),
          PostAssigment(
              textHeader: "Assignment Name",
              textDesciption: "Assignment short discription",
              textDate: "Submission Date : ",
              icon: ImageIcon(
                AssetImage("assets/postsubmission.png"),
                size: 24,
              )),

        ],
      ),
    );
  }
}
