import 'package:flutter/material.dart';

class ProjectMetric {
  final String label;
  final String value;
  final IconData icon;
  final Color accentColor;

  const ProjectMetric({
    required this.label,
    required this.value,
    required this.icon,
    required this.accentColor,
  });
}

class Project {
  final String title;
  final String category;
  final String role;
  final String summary;
  final String challenge;
  final String impact;
  final List<String> screenshots;
  final List<String> techStack;
  final List<ProjectMetric> metrics;
  final String githubUrl;
  final String playStoreUrl;
  final String? liveUrl;

  const Project({
    required this.title,
    required this.category,
    required this.role,
    required this.summary,
    required this.challenge,
    required this.impact,
    required this.screenshots,
    required this.techStack,
    required this.metrics,
    required this.githubUrl,
    required this.playStoreUrl,
    this.liveUrl,
  });
}
