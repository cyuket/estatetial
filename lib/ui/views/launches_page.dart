import 'package:estatetial/ui/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class LaunchesPage extends StatelessWidget {
  const LaunchesPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => CustomCardWidget(),
    );
  }
}
