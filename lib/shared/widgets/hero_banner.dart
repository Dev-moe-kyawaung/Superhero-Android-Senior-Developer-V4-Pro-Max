import 'package:flutter/material.dart';
import 'glass_card.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 64, 24, 28),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.22),
            Theme.of(context).colorScheme.secondary.withValues(alpha: 0.12),
            Colors.transparent,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1120),
        child: GlassCard(
          padding: const EdgeInsets.all(28),
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(milliseconds: 900),
            curve: Curves.easeOutCubic,
            builder: (context, t, child) {
              return Opacity(
                opacity: t,
                child: Transform.translate(
                  offset: Offset(0, 24 * (1 - t)),
                  child: child,
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Moe Kyaw Aung',
                  style: TextStyle(fontSize: 62, fontWeight: FontWeight.w900, height: 0.95),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Senior Android Developer | Superhero Portfolio V4 Pro Max',
                  style: TextStyle(fontSize: 20, color: Colors.white70),
                ),
                const SizedBox(height: 16),
                const SizedBox(
                  width: 820,
                  child: Text(
                    'Building flagship Android experiences with Kotlin, Jetpack Compose, clean architecture, and product-grade motion.',
                    style: TextStyle(fontSize: 18, height: 1.55, color: Colors.white70),
                  ),
                ),
                const SizedBox(height: 22),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    FilledButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.work_outline),
                      label: const Text('View Projects'),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.download),
                      label: const Text('Download Resume'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
