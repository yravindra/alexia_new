import 'package:alexia/modules/theme.dart';
import 'package:alexia/widget/mainpage/main_headers.dart';
import 'package:alexia/widget/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screen(
      scroll: true,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          builAppBar(""),
          MainHeader(),
        ],
      ),
    );
  }

  AppBar builAppBar(String pageName) {
    return AppBar(
      elevation: 0,
      backgroundColor: primaryColor,
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu_outlined,
            color: Colors.white,
          )),
    );
  }
}
