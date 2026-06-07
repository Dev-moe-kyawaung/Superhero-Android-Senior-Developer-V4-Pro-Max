import 'package:flutter/material.dart';
import 'glass_card.dart';

class TechStackCloud extends StatelessWidget {
  final List<String> tags;
  final ValueChanged<String> onTapTag;

  const TechStackCloud({super.key, required this.tags, required this.onTapTag});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: tags.map((tag) {
          return ActionChip(
            label: Text(tag),
            avatar: const Icon(Icons.bolt, size: 18),
            onPressed: () => onTapTag(tag),
            backgroundColor: Colors.white.withValues(alpha: 0.08),
            side: BorderSide(color: Colors.white.withValues(alpha: 0.06)),
          );
        }).toList(),
      ),
    );
  }
}
