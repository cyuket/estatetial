import 'package:estatetial/ui/shared/app_colors.dart';
import 'package:estatetial/ui/shared/shared_styles.dart';
import 'package:estatetial/ui/shared/ui_helpers.dart';
import 'package:estatetial/ui/views/launches_page.dart';
import 'package:estatetial/ui/views/rockets_pages.dart';
import 'package:estatetial/ui/views/upcoming_page.dart';
import 'package:estatetial/ui/widgets/custom_tab.dart';
import 'package:flutter/material.dart';

class HomeViewScreen extends StatefulWidget {
  @override
  _HomeViewScreenState createState() => _HomeViewScreenState();
}

class _HomeViewScreenState extends State<HomeViewScreen> {
  String active = "upcoming";

  void _onChangeTab(String value) {
    setState(() {
      active = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Icon(Icons.menu, color: Colors.white),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          "SpaceX",
          style: textStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [Icon(Icons.search, color: Colors.white), SizedBox(width: 20)],
      ),
      body: SafeArea(
        child: Column(
          children: [
            verticalSpace(20),
            Expanded(
              child: Container(
                height: double.infinity,
                width: screenWidth(context),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTab(
                          onTap: () {
                            _onChangeTab("upcoming");
                          },
                          active: active == "upcoming",
                          text: "Upcoming",
                        ),
                        CustomTab(
                          onTap: () {
                            _onChangeTab("launches");
                          },
                          active: active == "launches",
                          text: "Launches",
                        ),
                        CustomTab(
                          onTap: () {
                            _onChangeTab("rockets");
                          },
                          active: active == "rockets",
                          text: "Rockets",
                        ),
                      ],
                    ),
                    verticalSpace(20),
                    Expanded(
                      child: active == "upcoming"
                          ? UpcomingPage()
                          : active == "launches"
                              ? LaunchesPage()
                              : RocketsPage(),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
