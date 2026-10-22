import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/anime.dart';

class JikanService {
  static const _baseUrl = 'https://api.jikan.moe/v4';

  Future<List<Anime>> fetchTopAnime({int page = 1}) async {
    final uri = Uri.parse('$_baseUrl/top/anime?page=$page');
    final response = await http.get(uri).timeout(const Duration(seconds: 20));

    if (response.statusCode != 200) {
      throw Exception('Jikan API merespons ${response.statusCode}.');
    }

    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    final rows = decoded['data'] as List<dynamic>? ?? [];

    return rows
        .whereType<Map<String, dynamic>>()
        .map(Anime.fromJson)
        .toList();
  }

  Future<List<Anime>> searchAnime(String query) async {
    final uri = Uri.parse('$_baseUrl/anime').replace(
      queryParameters: {'q': query, 'limit': '20', 'sfw': 'true'},
    );
    final response = await http.get(uri).timeout(const Duration(seconds: 20));

    if (response.statusCode != 200) {
      throw Exception('Pencarian gagal (${response.statusCode}).');
    }

    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    final rows = decoded['data'] as List<dynamic>? ?? [];

    return rows
        .whereType<Map<String, dynamic>>()
        .map(Anime.fromJson)
        .toList();
  }
}
