import 'package:estatetial/constant/route_names.dart';
import 'package:estatetial/ui/shared/app_colors.dart';
import 'package:estatetial/ui/shared/shared_styles.dart';
import 'package:estatetial/ui/shared/ui_helpers.dart';
import 'package:estatetial/ui/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class UpcomingPage extends StatelessWidget {
  const UpcomingPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCardWidget(
          onTap: () {
            Navigator.pushNamed(context, DetailPageRoute);
          },
        ),
        verticalSpace(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "LAUNCH DATE".toUpperCase(),
              style: textStyle.copyWith(
                color: AppColors.primaryColor,
                fontSize: 10,
              ),
            ),
            verticalSpaceSmall,
            Text(
              "Thu Oct 17 5:30:00 2019",
              style: textStyle.copyWith(
                color: AppColors.textColor,
                fontSize: 16,
              ),
            ),
            verticalSpace(20),
            Text(
              "LAUNCH SITE".toUpperCase(),
              style: textStyle.copyWith(
                color: AppColors.primaryColor,
                fontSize: 10,
              ),
            ),
            verticalSpaceSmall,
            Text(
              "Cape Canaveral Air Force Station Space Launch Complex 40",
              style: textStyle.copyWith(
                color: AppColors.textColor,
                fontSize: 16,
              ),
            ),
            verticalSpace(20),
            Text(
              "COUNT DOWN".toUpperCase(),
              style: textStyle.copyWith(
                color: AppColors.primaryColor,
                fontSize: 10,
              ),
            ),
            verticalSpaceSmall,
            Text(
              "5 Hrs 30mins more...",
              style: textStyle.copyWith(
                color: AppColors.textColor,
                fontSize: 16,
              ),
            ),
            verticalSpace(20),
          ],
        ),
      ],
    );
  }
}
