import 'package:estatetial/constant/route_names.dart';
import 'package:estatetial/ui/shared/base_view.dart';
import 'package:estatetial/ui/widgets/custom_card.dart';
import 'package:estatetial/viewmodel/lauches_view_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LaunchesPage extends StatelessWidget {
  const LaunchesPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LaunchesViewModel>(onModelReady: (model) {
      if (model.launches.isEmpty) {
        model.fetchLaunches();
      }
    }, builder: (context, model, child) {
      return model.busy
          ? ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
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
                ),
              ),
            )
          : AnimatedContainer(
              duration: Duration(seconds: 3),
              curve: Curves.easeOut,
              child: ListView.builder(
                itemCount: model.launches.length,
                itemBuilder: (context, index) => CustomCardWidget(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailPageRoute,
                      arguments: model.launches[index],
                    );
                  },
                  launchModel: model.launches[index],
                ),
              ),
            );
    });
  }
}
