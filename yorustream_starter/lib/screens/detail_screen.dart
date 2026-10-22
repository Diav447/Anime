import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/anime.dart';
import 'player_screen.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.anime});

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail anime')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          if (anime.imageUrl.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: anime.imageUrl,
                height: 300,
                fit: BoxFit.contain,
                placeholder: (_, __) => const SizedBox(
                  height: 300,
                  child: Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (_, __, ___) => const SizedBox(
                  height: 180,
                  child: Center(child: Icon(Icons.broken_image, size: 48)),
                ),
              ),
            ),
          const SizedBox(height: 18),
          Text(anime.title,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          Text('⭐ ${anime.score?.toStringAsFixed(1) ?? 'Belum ada rating'}'),
          if (anime.genres.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(anime.genres.join(' • '),
                style: TextStyle(color: Colors.white.withValues(alpha: 0.65))),
          ],
          const SizedBox(height: 18),
          const Text('Sinopsis',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Text(anime.synopsis),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const PlayerScreen()),
            ),
            icon: const Icon(Icons.play_arrow_rounded),
            label: const Text('Buka player demo'),
          ),
          const SizedBox(height: 8),
          Text(
            'Player demo memakai sumber video uji. Daftar episode dan sumber tayang resmi akan ditambahkan setelah katalog dasar stabil.',
            style: TextStyle(color: Colors.white.withValues(alpha: 0.55), fontSize: 12),
          ),
        ],
      ),
    );
  }
}
