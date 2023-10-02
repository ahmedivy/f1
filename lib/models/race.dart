import 'circuit.dart';

class Race {
  String season;
  int round;
  String url;
  String name;
  Circuit circuit;
  DateTime date;
  DateTime firstPractice;
  DateTime secondPractice;
  DateTime? thirdPractice;
  DateTime qualifying;
  DateTime? sprint;

  Race({
    required this.season,
    required this.round,
    required this.url,
    required this.name,
    required this.circuit,
    required this.date,
    required this.firstPractice,
    required this.secondPractice,
    this.thirdPractice,
    required this.qualifying,
    this.sprint,
  });

  factory Race.fromJson(Map<String, dynamic> json) {
    DateTime parseDateTime(String dateStr, String timeStr) {
      return DateTime.parse('$dateStr $timeStr');
    }

    final circuit = Circuit.fromJson(json['Circuit']);
    final season = json['season'];
    final round = int.parse(json['round']);
    final url = json['url'];
    final name = json['raceName'];
    final date = parseDateTime(json['date'], json['time']);
    final firstPractice = parseDateTime(
        json['FirstPractice']['date'], json['FirstPractice']['time']);
    final secondPractice = parseDateTime(
        json['SecondPractice']['date'], json['SecondPractice']['time']);

    final thirdPractice = json['ThirdPractice'] != null
        ? parseDateTime(
            json['ThirdPractice']['date'], json['ThirdPractice']['time'])
        : null;

    final qualifying =
        parseDateTime(json['Qualifying']['date'], json['Qualifying']['time']);
    final sprint = json['Sprint'] != null
        ? parseDateTime(json['Sprint']['date'], json['Sprint']['time'])
        : null;

    return Race(
      season: season,
      round: round,
      url: url,
      name: name,
      circuit: circuit,
      date: date,
      firstPractice: firstPractice,
      secondPractice: secondPractice,
      thirdPractice: thirdPractice,
      qualifying: qualifying,
      sprint: sprint,
    );
  }
}
