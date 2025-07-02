import 'package:flutter/material.dart';
import 'package:devrede_portfolio/models/project.dart';
import 'package:devrede_portfolio/constants/app_colors.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            project.imageUrl,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),
                const SizedBox(height: 8),
                Text(project.description),
                const SizedBox(height: 8),
                Chip(
                  label: Text(project.platform),
                  backgroundColor: AppColors.secondary.withOpacity(0.2),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
