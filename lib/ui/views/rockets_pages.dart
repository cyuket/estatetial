import 'package:estatetial/ui/widgets/rocket_cards.dart';
import 'package:flutter/material.dart';

class RocketsPage extends StatelessWidget {
  const RocketsPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => RocketCardWidget(),
    );
  }
}
