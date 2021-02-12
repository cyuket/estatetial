import 'package:estatetial/constant/route_names.dart';
import 'package:estatetial/ui/shared/app_colors.dart';
import 'package:estatetial/ui/shared/base_view.dart';
import 'package:estatetial/ui/shared/shared_styles.dart';
import 'package:estatetial/ui/shared/ui_helpers.dart';
import 'package:estatetial/ui/widgets/custom_card.dart';
import 'package:estatetial/viewmodel/upcoming_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:shimmer/shimmer.dart';

class UpcomingPage extends StatelessWidget {
  const UpcomingPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<UpcomingViewModel>(onModelReady: (model) {
      if (model.upcoming == null) {
        model.fetchUpcoming();
      }
    }, builder: (context, model, child) {
      final launchDate = DateFormat.yMEd()
          .add_jms()
          .format(DateTime.parse(model?.upcoming?.launchDate));

      return model.busy
          ? Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child: Material(
                elevation: 10,
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                shadowColor: Colors.black.withOpacity(0.2),
                child: Container(
                  height: 128,
                  width: double.infinity,
                ),
              ),
            )
          : Column(
              children: [
                CustomCardWidget(
                  launchModel: model.upcoming,
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
                      "$launchDate",
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
                      "${model.upcoming.launchSiteLong}",
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
    });
  }
}
