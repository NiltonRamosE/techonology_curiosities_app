import '../../../domain/entities/curiosity.dart';

class CuriosityModel extends Curiosity {
  CuriosityModel({
    required super.id,
    required super.emoji,
    required super.title,
    required super.description,
    required super.documentation,
    required super.methods,
    required super.health,
    required super.popularity,
    required super.avgReliability,
    required super.avgError,
    required super.avgLatency,
    required super.source,
  });

  factory CuriosityModel.fromJson(Map<String, dynamic> json) {
    return CuriosityModel(
      id: json['id'],
      emoji: json['emoji'],
      title: json['title'],
      description: json['description'],
      documentation: json['documentation'],
      methods: json['methods'],
      health: json['health'],
      popularity: json['popularity'],
      avgReliability: (json['avg_reliability'] ?? 0).toDouble(),
      avgError: (json['avg_error'] ?? 0).toDouble(),
      avgLatency: json['avg_latency'] ?? 0,
      source: json['source'],
    );
  }
}
