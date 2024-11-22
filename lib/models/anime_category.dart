import 'package:flutter/material.dart';

@immutable
class AnimeCategory {
  final String title;
  final String rankingType;

  const AnimeCategory({
    required this.title,
    required this.rankingType,
  });

  factory AnimeCategory.fromJson(Map<String, dynamic> json) {
    return AnimeCategory(
      title: json['title'],
      rankingType: json['rankingType'],
    );
  }
}
