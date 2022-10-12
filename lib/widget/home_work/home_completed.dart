import 'package:alexia/widget/screen/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompletedHomeWork extends StatelessWidget {
  final SvgPicture personIcon, done;
  final String subject, completed;

  const CompletedHomeWork(
      {Key? key,
      required this.personIcon,
      required this.done,
      required this.subject,
      required this.completed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screen(
        child: Row(
      children: [
        Card(
          color: Colors.white.withOpacity(0.6),
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: personIcon,
            title: Text(subject),
            subtitle: Text(completed),
            trailing: done,
          ),
        )
      ],
    ));
  }
}
