import 'package:flutter/material.dart';
import '../../models/project.dart';
import '../../shared/utils/url_service.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/section_header.dart';
import '../../shared/widgets/screenshot_carousel.dart';
import '../../shared/widgets/tech_stack_cloud.dart';

class ProjectDetailPage extends StatelessWidget {
  final Project project;

  const ProjectDetailPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(project.title)),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1120),
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              _HeroSection(project: project),
              const SizedBox(height: 28),
              ScreenshotCarousel(screenshots: project.screenshots),
              const SizedBox(height: 28),
              _ActionRow(project: project),
              const SizedBox(height: 28),
              SectionHeader(title: 'Design Challenge', subtitle: project.challenge),
              const SizedBox(height: 18),
              SectionHeader(title: 'Impact', subtitle: project.impact),
              const SizedBox(height: 28),
              const Text('Performance Metrics', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
              const SizedBox(height: 12),
              _MetricsGrid(metrics: project.metrics),
              const SizedBox(height: 28),
              const Text('Tech Stack', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
              const SizedBox(height: 12),
              TechStackCloud(
                tags: project.techStack,
                onTapTag: (tag) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text(tag),
                      content: const Text('Highlighted as part of the project’s Android engineering stack.'),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  final Project project;

  const _HeroSection({required this.project});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _Badge(text: project.category),
              _Badge(text: project.role),
            ],
          ),
          const SizedBox(height: 18),
          Text(project.title, style: const TextStyle(fontSize: 38, fontWeight: FontWeight.w900)),
          const SizedBox(height: 12),
          Text(project.summary, style: const TextStyle(fontSize: 16, height: 1.6, color: Colors.white70)),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;

  const _Badge({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}

class _ActionRow extends StatelessWidget {
  final Project project;

  const _ActionRow({required this.project});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        FilledButton.icon(
          onPressed: () => UrlService.open(project.githubUrl),
          icon: const Icon(Icons.code),
          label: const Text('GitHub Repository'),
        ),
        FilledButton.icon(
          onPressed: () => UrlService.open(project.playStoreUrl),
          icon: const Icon(Icons.shop),
          label: const Text('Play Store'),
        ),
        if (project.liveUrl != null)
          OutlinedButton.icon(
            onPressed: () => UrlService.open(project.liveUrl!),
            icon: const Icon(Icons.public),
            label: const Text('Live Demo'),
          ),
      ],
    );
  }
}

class _MetricsGrid extends StatelessWidget {
  final List<ProjectMetric> metrics;

  const _MetricsGrid({required this.metrics});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final cols = width >= 1100 ? 5 : (width >= 700 ? 3 : 2);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: metrics.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: cols,
        mainAxisExtent: 120,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (_, i) {
        final metric = metrics[i];
        return GlassCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(metric.icon, size: 18, color: metric.accentColor),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      metric.label,
                      style: const TextStyle(fontSize: 13, color: Colors.white70),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Text(metric.value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
            ],
          ),
        );
      },
    );
  }
}
