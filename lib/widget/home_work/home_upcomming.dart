import 'package:alexia/widget/screen/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UpcommingHomeWork extends StatelessWidget {
  final SvgPicture upload;
  final String subject, date;

  const UpcommingHomeWork(
      {Key? key,
      required this.upload,
      required this.subject,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screen(

        child: Row(children: [
      Card(
        color: Colors.white.withOpacity(0.6),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Text(subject),
          title: Text(subject),
          subtitle: Text('Submission Date'),
          trailing: upload,
        ),
      )
    ]));
  }
}
