import 'package:flutter/material.dart';
import '../features/home/home_page.dart';
import '../shared/theme/app_theme.dart';

class SuperheroPortfolioApp extends StatelessWidget {
  const SuperheroPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Superhero Android Senior Developer V4 Pro Max',
      theme: AppTheme.dark(),
      home: const HomePage(),
    );
  }
}
