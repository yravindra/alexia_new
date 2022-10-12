import 'package:alexia/modules/theme.dart';
import 'package:alexia/widget/home_work/home_completed.dart';
import 'package:alexia/widget/home_work/home_upcomming.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeWorkTab extends StatelessWidget {

  HomeWorkTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              indicatorColor: whiteTextColor,
              labelColor: whiteTextColor,
              tabs: [
                Tab(
                  text: 'Complete',
                ),
                Tab(
                  text: 'Upcoming',
                )
              ],
            ),
            title: const Text('Home Work'),
            leading: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            actions: const [
              Icon(
                Icons.person,
                color: Colors.white,
              ),
            ],
            backgroundColor: primaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
          ),
          body: const TabBarView(
            children: [

            ],
          ),
        ));
  }
}
