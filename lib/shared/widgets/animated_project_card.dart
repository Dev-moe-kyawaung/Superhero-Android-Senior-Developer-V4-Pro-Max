import 'package:flutter/material.dart';
import '../../models/project.dart';
import 'glass_card.dart';

class AnimatedProjectCard extends StatefulWidget {
  final Project project;
  final VoidCallback onTap;

  const AnimatedProjectCard({super.key, required this.project, required this.onTap});

  @override
  State<AnimatedProjectCard> createState() => _AnimatedProjectCardState();
}

class _AnimatedProjectCardState extends State<AnimatedProjectCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedScale(
        scale: hovered ? 1.03 : 1.0,
        duration: const Duration(milliseconds: 180),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          transform: Matrix4.translationValues(0, hovered ? -6 : 0, 0),
          child: GlassCard(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              borderRadius: BorderRadius.circular(28),
              onTap: widget.onTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.primary.withValues(alpha: 0.95),
                          Theme.of(context).colorScheme.secondary.withValues(alpha: 0.88),
                          const Color(0xFFFFC857).withValues(alpha: 0.72),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        widget.project.category,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(widget.project.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 6),
                  Text(widget.project.summary, maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.project.techStack.take(4).map((t) => Chip(label: Text(t))).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
