class JokeModel {
  final num id;
  String? type;
  String? setup;
  String? punchline;

  JokeModel({required this.id, this.type, this.setup, this.punchline});

  factory JokeModel.fromJson(Map<String, dynamic> json) {
    return JokeModel(
      id: json['id'] as num,
      type: json['type'] as String?,
      setup: json['setup'] as String?,
      punchline: json['punchline'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'type': type, 'setup': setup, 'punchline': punchline};
  }
}
