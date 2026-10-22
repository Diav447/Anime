class Anime {
  const Anime({
    required this.id,
    required this.title,
    required this.synopsis,
    required this.imageUrl,
    this.score,
    this.genres = const [],
  });

  final int id;
  final String title;
  final String synopsis;
  final String imageUrl;
  final double? score;
  final List<String> genres;

  factory Anime.fromJson(Map<String, dynamic> json) {
    final images = json['images'] as Map<String, dynamic>? ?? {};
    final jpg = images['jpg'] as Map<String, dynamic>? ?? {};
    final genresJson = json['genres'] as List<dynamic>? ?? [];

    return Anime(
      id: json['mal_id'] as int? ?? 0,
      title: (json['title'] as String?) ?? 'Untitled',
      synopsis: (json['synopsis'] as String?) ?? 'Sinopsis belum tersedia.',
      imageUrl: (jpg['large_image_url'] as String?) ??
          (jpg['image_url'] as String?) ??
          '',
      score: (json['score'] as num?)?.toDouble(),
      genres: genresJson
          .whereType<Map<String, dynamic>>()
          .map((genre) => genre['name'] as String? ?? '')
          .where((name) => name.isNotEmpty)
          .toList(),
    );
  }
}
