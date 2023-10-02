class Circuit {
  String id;
  String url;
  String name;

  Circuit({required this.id, required this.url, required this.name});

  factory Circuit.fromJson(Map<String, dynamic> json) {
    return Circuit(
      id: json['circuitId'],
      url: json['url'],
      name: json['circuitName'],
    );
  }
}
