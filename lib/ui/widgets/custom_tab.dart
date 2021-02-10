import 'package:estatetial/ui/shared/app_colors.dart';
import 'package:estatetial/ui/shared/shared_styles.dart';
import 'package:estatetial/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({
    Key key,
    @required this.active,
    @required this.text,
    @required this.onTap,
  }) : super(key: key);

  final bool active;
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: text == "Upcoming"
            ? CrossAxisAlignment.start
            : text == "Launches"
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.end,
        children: [
          Text(
            text,
            style: textStyle.copyWith(
              color: active ? AppColors.primaryColor : AppColors.textColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          verticalSpace(8),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: active ? AppColors.primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
            ),
          )
        ],
      ),
    );
  }
}
