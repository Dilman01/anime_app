import 'dart:convert';

import 'package:anime_app/models/anime_details.dart';
import 'package:anime_app/models/anime_info.dart';
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

  Future<List<Anime>> getAnimesbySearch({
    required String query,
  }) async {
    final baseUrl = "https://api.myanimelist.net/v2/anime?q=$query";

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'X-MAL-CLIENT-ID': clientId,
      },
    );

    if (response.statusCode == 200) {
      // Successful response
      final Map<String, dynamic> data = json.decode(response.body);
      AnimeInfo animeInfo = AnimeInfo.fromJson(data);
      Iterable<Anime> animes = animeInfo.animes;

      return animes.toList();
    } else {
      // Error handling
      print("Error: ${response.statusCode}");
      print("Body: ${response.body}");
      throw Exception("Failed to get data!");
    }
  }

  Future<List<Anime>> getSeasonalAnimes({
    required int year,
    required String season,
    int limit = 500,
  }) async {
    final baseUrl =
        "https://api.myanimelist.net/v2/anime/season/$year/${season.toLowerCase()}?limit=$limit";

    // Make a GET request
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'X-MAL-CLIENT-ID': clientId,
      },
    );

    if (response.statusCode == 200) {
      // Successful response
      final Map<String, dynamic> data = json.decode(response.body);
      final seasonalAnime = AnimeInfo.fromJson(data);

      return seasonalAnime.animes.toList();
    } else {
      // Error handling
      print("Error: ${response.statusCode}");
      print("Body: ${response.body}");
      throw Exception("Failed to get data!");
    }
  }

  Future<AnimeDetails> getAnimeDetails({
    required int id,
  }) async {
    final baseUrl =
        'https://api.myanimelist.net/v2/anime/$id?fields=id,title,main_picture,alternative_titles,start_date,end_date,synopsis,mean,rank,popularity,num_list_users,num_scoring_users,nsfw,created_at,updated_at,media_type,status,genres,my_list_status,num_episodes,start_season,broadcast,source,average_episode_duration,rating,pictures,background,related_anime,related_manga,recommendations,studios,statistics';

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'X-MAL-CLIENT-ID': clientId,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final animeDetails = AnimeDetails.fromJson(data);
      return animeDetails;
    } else {
      print('Code: ${response.statusCode}');
      print('Error: ${response.body}');
      throw Exception('Could Not Get Data!');
    }
  }
}
