import 'package:flutter/material.dart';
import '../../data/sample_projects.dart';
import '../../shared/widgets/animated_project_card.dart';
import '../../shared/widgets/hero_banner.dart';
import '../../shared/widgets/power_stats_row.dart';
import '../../shared/widgets/section_header.dart';
import '../projects/project_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: HeroBanner()),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        const SliverToBoxAdapter(child: PowerStatsRow()),
        const SliverToBoxAdapter(child: SizedBox(height: 28)),
        const SliverToBoxAdapter(
          child: SectionHeader(
            title: 'Featured Projects',
            subtitle: 'Five flagship Android case studies designed to prove performance, polish, and product thinking.',
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(24),
          sliver: SliverLayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.crossAxisExtent;
              final cols = width >= 1200 ? 2 : 1;
              return SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: sampleProjects.length,
                  (context, i) => AnimatedProjectCard(
                    project: sampleProjects[i],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProjectDetailPage(project: sampleProjects[i]),
                        ),
                      );
                    },
                  ),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  mainAxisExtent: 390,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
