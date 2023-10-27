import 'package:f1/models/race.dart';
import 'package:flutter/material.dart';

class RaceDetails extends StatelessWidget {
  const RaceDetails({super.key, required this.race});
  final Race race;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(race.name),
      ),
      body: Column(
        children: [
          Text(
            race.url,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(race.toString(), style: Theme.of(context).textTheme.bodySmall)
        ],
      ),
    );
  }
}
