import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RaceList extends StatefulWidget {
  const RaceList({super.key});

  @override
  State<RaceList> createState() => _RaceListState();
}

class _RaceListState extends State<RaceList> {
  List<dynamic> races = [];

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
      setState(() {
        races = data['MRData']['RaceTable']['Races'];
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
              final raceName = race['raceName'];
              final circuitName = race['Circuit']['circuitName'];
              final date = DateTime.parse(race["date"]);

              final formattedDate = DateFormat('d MMM').format(date);

              return ListTile(
                  title: Text(raceName,
                      style: Theme.of(context).textTheme.titleMedium),
                  subtitle: Text(
                    circuitName,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onTap: () {
                    // You can navigate to the race details or perform other actions here.
                  },
                  trailing: Text(
                    formattedDate,
                    style: Theme.of(context).textTheme.bodySmall,
                  ));
            },
          );
  }
}
