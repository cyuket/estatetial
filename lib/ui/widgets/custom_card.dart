import 'package:estatetial/ui/shared/app_colors.dart';
import 'package:estatetial/ui/shared/shared_styles.dart';
import 'package:estatetial/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    Key key,
    this.onTap,
  }) : super(key: key);
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Material(
          elevation: 10,
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          shadowColor: Colors.black.withOpacity(0.2),
          child: Container(
            height: 128,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                SizedBox(
                  height: 85,
                  width: 85,
                ),
                horizontalSpaceMedium,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "LAUNCH".toUpperCase(),
                      style: textStyle.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      "Starlink 2",
                      style: textStyle.copyWith(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "CCAES SLC 40".toUpperCase(),
                      style: textStyle.copyWith(
                        color: AppColors.textColor,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "16-10-2016".toUpperCase(),
                      style: textStyle.copyWith(
                        color: AppColors.textColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
