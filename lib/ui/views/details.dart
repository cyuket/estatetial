import 'package:estatetial/constant/app_assets.dart';
import 'package:estatetial/model/launch_model.dart';
import 'package:estatetial/ui/shared/app_colors.dart';
import 'package:estatetial/ui/shared/shared_styles.dart';
import 'package:estatetial/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPageScreen extends StatelessWidget {
  final LaunchModel launchModel;

  DetailPageScreen({@required this.launchModel});
  @override
  Widget build(BuildContext context) {
    final launchDate =
        DateFormat.yMd().format(DateTime.parse(launchModel?.launchDate));
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
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
                child: Image.network(launchModel.image),
              ),
              verticalSpace(30),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailCard(
                      label: "Rocket",
                      text: "${launchModel.rocket}",
                      isBold: true,
                    ),
                    DetailCard(
                      label: "Launch date",
                      text: "$launchDate",
                      isBold: true,
                    ),
                    DetailCard(
                      label: "LAUNCH SITE",
                      text: "${launchModel.launchSiteShort}",
                    ),
                    DetailCard(
                      label: "LAUNCH STATUS",
                      text: launchModel.launchStatus ? "Success" : "Failed",
                    ),
                    DetailCard(
                      label: "DETAILS",
                      text: "${launchModel.detail}",
                    ),
                    DetailCard(
                      label: "ROCKET SUMMARY",
                      text: "${launchModel.rocket}",
                    ),
                    DetailCard(
                      label: "TYPE",
                      text: "${launchModel.rocketType}",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DetailCard(
                          label: "FIRST STAGE",
                          text: "Cores: ${launchModel.firstStage}",
                        ),
                        DetailCard(
                          label: "SECOND STAGE",
                          text: launchModel.secondStage == null
                              ? "Payloads: 0kg"
                              : "Payloads: ${launchModel.secondStage}kg",
                          isSmall: true,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                child: Image.asset(AppAssets.redit),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20, bottom: 20),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SNEAK PEAK".toUpperCase(),
                        style: textStyle.copyWith(
                          color: AppColors.primaryColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      verticalSpaceSmall,
                      launchModel.images.length == 0
                          ? Text(
                              "No Images",
                              style: textStyle.copyWith(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : Container(
                              height: 295,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: launchModel.images.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 14.0),
                                      child: Container(
                                        height: 347,
                                        width: 291,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              "${launchModel.images[index]}",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            )
                    ],
                  ),
                ),
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
            "$label".toUpperCase(),
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
