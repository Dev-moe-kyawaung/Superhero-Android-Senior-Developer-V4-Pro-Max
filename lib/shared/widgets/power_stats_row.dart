import 'package:flutter/material.dart';
import 'glass_card.dart';

class PowerStatsRow extends StatelessWidget {
  const PowerStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = const [
      ('5+', 'Years Android'),
      ('5', 'Flagship Projects'),
      ('82+', 'Certifications'),
      ('50K+', 'Users Reached'),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Wrap(
        spacing: 14,
        runSpacing: 14,
        children: List.generate(stats.length, (i) {
          final s = stats[i];
          return TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.92, end: 1),
            duration: Duration(milliseconds: 520 + i * 90),
            curve: Curves.easeOutBack,
            builder: (context, scale, child) => Transform.scale(scale: scale, child: child),
            child: SizedBox(
              width: 180,
              child: GlassCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(s.$1, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
                    const SizedBox(height: 4),
                    Text(s.$2, style: const TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
