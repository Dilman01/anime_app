import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/anime.dart';

import '/core/config/app_config.dart';

class AnimeRepository {
  Future<List<Anime>> getAnimeByRankingType({
    required String rankingType,
    int limit = 10,
  }) async {
    final baseUrl =
        'https://api.myanimelist.net/v2/anime/ranking?ranking_type=$rankingType&limit=$limit';

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'X-MAL-CLIENT-ID': clientId,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> animeNodeList = data['data'];
      final List<Anime> animes = animeNodeList
          .where(
        // Some animes miss main picture so it broke the list view
        // and sometimes even the entire list, and sadly when I checked
        // if the entire node was null, it passes.
        (animeNode) => animeNode['node']['main_picture'] != null,
      )
          .map(
        (node) {
          return Anime.fromJson(node);
        },
      ).toList();

      return animes;
    } else {
      print("Error: ${response.statusCode}");
      print("Body: ${response.body}");
      throw Exception("Failed to get data!");
    }
  }

  // Future<String> getCategoryPictureApi({
  //   required String category,
  // }) async {
  //   final baseUrl =
  //       'https://api.myanimelist.net/v2/anime/ranking?ranking_type=$category&limit=1';

  //   final response = await http.get(
  //     Uri.parse(baseUrl),
  //     headers: {
  //       'X-MAL-CLIENT-ID': clientId,
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> data = jsonDecode(response.body);
  //     final animes = AnimeInfo.fromJson(data);
  //     final mainPicture = animes.animes.first.node.mainPicture.large;

  //     return mainPicture;
  //   } else {
  //     print("Error: ${response.statusCode}");
  //     print("Body: ${response.body}");
  //     throw Exception("Failed to get data!");
  //   }
  // }
}