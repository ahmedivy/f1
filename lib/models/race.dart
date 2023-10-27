import 'circuit.dart';

class Race {
  String season;
  int round;
  String url;
  String name;
  Circuit circuit;
  DateTime raceDate;
  DateTime firstPractice;
  DateTime? secondPractice;
  DateTime? thirdPractice;
  DateTime qualifying;
  DateTime? sprint;
  DateTime? sprintShootout;

  Race({
    required this.season,
    required this.round,
    required this.url,
    required this.name,
    required this.circuit,
    required this.raceDate,
    required this.firstPractice,
    required this.qualifying,
    this.secondPractice,
    this.thirdPractice,
    this.sprint,
    this.sprintShootout,
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

    final raceDate = parseDateTime(json['date'], json['time']);
    final firstPractice = parseDateTime(
        json['FirstPractice']['date'], json['FirstPractice']['time']);

    final qualifying =
        parseDateTime(json['Qualifying']['date'], json['Qualifying']['time']);

    final sprint = json['Sprint'] != null
        ? parseDateTime(json['Sprint']['date'], json['Sprint']['time'])
        : null;

    DateTime? secondPractice;
    DateTime? sprintShootout;

    if (sprint != null) {
      sprintShootout = json['SecondPractice'] != null
          ? parseDateTime(
              json['SecondPractice']['date'], json['SecondPractice']['time'])
          : null;
      secondPractice = null;
    } else {
      secondPractice = json['SecondPractice'] != null
          ? parseDateTime(
              json['SecondPractice']['date'], json['SecondPractice']['time'])
          : null;
      sprintShootout = null;
    }
    final thirdPractice = json['ThirdPractice'] != null
        ? parseDateTime(
            json['ThirdPractice']['date'], json['ThirdPractice']['time'])
        : null;

    return Race(
      season: season,
      round: round,
      url: url,
      name: name,
      circuit: circuit,
      raceDate: raceDate,
      firstPractice: firstPractice,
      secondPractice: secondPractice,
      sprintShootout: sprintShootout,
      thirdPractice: thirdPractice,
      qualifying: qualifying,
      sprint: sprint,
    );
  }

  @override
  String toString() {
    return 'Race{'
        'season: $season, '
        'round: $round, '
        'url: $url, '
        'name: $name, '
        'circuit: $circuit, '
        'date: $raceDate, '
        'firstPractice: $firstPractice, '
        'secondPractice: $secondPractice, '
        'thirdPractice: $thirdPractice, '
        'qualifying: $qualifying, '
        'sprint: $sprint, '
        'sprintShootout: $sprintShootout'
        '}';
  }
}
