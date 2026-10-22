import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/anime.dart';

class AnimeCard extends StatelessWidget {
  const AnimeCard({super.key, required this.anime, required this.onTap});

  final Anime anime;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: SizedBox(
                width: double.infinity,
                child: anime.imageUrl.isEmpty
                    ? const ColoredBox(
                        color: Color(0xFF171722),
                        child: Center(child: Icon(Icons.movie_outlined, size: 42)),
                      )
                    : CachedNetworkImage(
                        imageUrl: anime.imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (_, __) => const ColoredBox(
                          color: Color(0xFF171722),
                          child: Center(child: CircularProgressIndicator()),
                        ),
                        errorWidget: (_, __, ___) => const ColoredBox(
                          color: Color(0xFF171722),
                          child: Center(child: Icon(Icons.broken_image_outlined)),
                        ),
                      ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            anime.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.star_rounded, size: 16, color: Color(0xFFFFD166)),
              const SizedBox(width: 4),
              Text(anime.score?.toStringAsFixed(1) ?? 'N/A',
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.65))),
            ],
          ),
        ],
      ),
    );
  }
}
