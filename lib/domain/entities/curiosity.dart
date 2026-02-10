class Curiosity {
  final int id;
  final String emoji;
  final String title;
  final String description;
  final String documentation;
  final int methods;
  final int health;
  final int popularity;
  final double avgReliability;
  final double avgError;
  final int avgLatency;
  final String source;

  Curiosity({
    required this.id,
    required this.emoji,
    required this.title,
    required this.description,
    required this.documentation,
    required this.methods,
    required this.health,
    required this.popularity,
    required this.avgReliability,
    required this.avgError,
    required this.avgLatency,
    required this.source,
  });
}
