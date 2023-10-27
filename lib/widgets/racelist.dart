import 'dart:convert';
import 'package:f1/models/race.dart';
import 'package:f1/pages/race_details.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RaceList extends StatefulWidget {
  const RaceList({super.key});

  @override
  State<RaceList> createState() => _RaceListState();
}

class _RaceListState extends State<RaceList> {
  List<Race> races = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse("https://ergast.com/api/f1/2023.json"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final racesData = data['MRData']['RaceTable']['Races'];

      final List<Race> temp = [];
      for (var race in racesData) {
        temp.add(Race.fromJson(race));
      }
      setState(() {
        races = temp;
      });
    } else {
      throw Exception('Failed to Load Data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return races.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: races.length,
            itemBuilder: (BuildContext context, int index) {
              final race = races[index];

              final formattedDate = DateFormat('d MMM').format(race.raceDate);

              return ListTile(
                  title: Text(race.name,
                      style: Theme.of(context).textTheme.titleMedium),
                  subtitle: Text(
                    race.circuit.name,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onTap: () {
                    // You can navigate to the race details or perform other actions here.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RaceDetails(race: race),
                      ),
                    );
                  },
                  trailing: Text(
                    formattedDate,
                    style: Theme.of(context).textTheme.bodySmall,
                  ));
            },
          );
  }
}
