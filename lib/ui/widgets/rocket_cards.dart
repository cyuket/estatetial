import 'package:estatetial/constant/app_assets.dart';
import 'package:estatetial/model/rocket_model.dart';
import 'package:estatetial/ui/shared/app_colors.dart';
import 'package:estatetial/ui/shared/shared_styles.dart';
import 'package:estatetial/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class RocketCardWidget extends StatelessWidget {
  const RocketCardWidget({Key key, @required this.rocketModel})
      : super(key: key);

  final RocketModel rocketModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                  child: Image.asset(AppAssets.rocket),
                ),
                horizontalSpaceMedium,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ROCKET".toUpperCase(),
                      style: textStyle.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      "${rocketModel.name}",
                      style: textStyle.copyWith(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      width: 69,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: rocketModel.active
                            ? Color(0xff16BE27)
                            : Color(0xffFF06067),
                      ),
                      child: Center(
                        child: Text(
                          rocketModel.active ? "ACTIVATE" : "INACTIVE",
                          style: textStyle.copyWith(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(10)
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
