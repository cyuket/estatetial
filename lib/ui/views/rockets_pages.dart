import 'package:estatetial/ui/shared/base_view.dart';
import 'package:estatetial/ui/widgets/rocket_cards.dart';
import 'package:estatetial/viewmodel/rocket_view_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RocketsPage extends StatelessWidget {
  const RocketsPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<RocketViewModel>(onModelReady: (model) {
      if (model.rockets.isEmpty) {
        model.fetchRockets();
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
          : ListView.builder(
              itemCount: model.rockets.length,
              itemBuilder: (context, index) => RocketCardWidget(
                rocketModel: model.rockets[index],
              ),
            );
    });
  }
}
