import 'package:estatetial/ui/shared/app_colors.dart';
import 'package:estatetial/ui/shared/shared_styles.dart';
import 'package:estatetial/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class DetailPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Icon(Icons.menu, color: Colors.white),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
        actions: [Icon(Icons.share, color: Colors.white), SizedBox(width: 20)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 85,
                width: 85,
              ),
              verticalSpace(30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailCard(
                    label: "Rocket",
                    text: "Falcon 1",
                    isBold: true,
                  ),
                  DetailCard(
                    label: "LAUNCH SITE",
                    text: "CCAFS SLC 40",
                  ),
                  DetailCard(
                    label: "LAUNCH STATUS",
                    text: "Success",
                  ),
                  DetailCard(
                    label: "DETAILS",
                    text:
                        "Last launch of the original Falcon 9 v1.0 launch vehicle",
                  ),
                  DetailCard(
                    label: "ROCKET SUMMARY",
                    text: "Falcon 9",
                  ),
                  DetailCard(
                    label: "TYPE",
                    text: "v1.0",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DetailCard(
                        label: "FIRST STAGE",
                        text: "Cores: 4",
                      ),
                      DetailCard(
                        label: "SECOND STAGE",
                        text: "Payloads: 150kg",
                        isSmall: true,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "YOUTUBE".toUpperCase(),
                            style: textStyle.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          verticalSpaceSmall,
                          Container(
                            width: 112,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color(0xffD21F06),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "REDDIT".toUpperCase(),
                            style: textStyle.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          verticalSpaceSmall,
                          Container(
                            width: 112,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color(0xffD21F06),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DetailCard extends StatelessWidget {
  const DetailCard({
    Key key,
    this.isBold = false,
    this.isSmall = false,
    this.label,
    this.text,
  }) : super(key: key);

  final String label;
  final String text;
  final bool isBold, isSmall;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: textStyle.copyWith(
              color: AppColors.primaryColor,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
          verticalSpaceSmall,
          Text(
            text,
            style: textStyle.copyWith(
              color: Colors.white,
              fontSize: isSmall ? 14 : 18,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
