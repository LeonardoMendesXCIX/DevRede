import 'package:flutter/material.dart';
import 'package:devrede_portfolio/constants/app_colors.dart';
import 'package:devrede_portfolio/constants/app_texts.dart';
import 'package:devrede_portfolio/models/project.dart';
import 'package:devrede_portfolio/widgets/project_card.dart';
import 'package:devrede_portfolio/widgets/responsive_layout.dart';
import 'package:devrede_portfolio/widgets/header.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      Project(
        title: "App de Finanças",
        description: "Aplicativo de controle financeiro para Android e iOS.",
        platform: "Mobile",
        imageUrl: "https://via.placeholder.com/400x300",
      ),
      Project(
        title: "Dashboard Administrativo",
        description: "Painel de controle para empresas.",
        platform: "Web",
        imageUrl: "https://via.placeholder.com/400x300",
      ),
      Project(
        title: "Site Portfólio",
        description: "Website responsivo para desenvolvedores.",
        platform: "Web",
        imageUrl: "https://via.placeholder.com/400x300",
      ),
      Project(
        title: "Marketplace Flutter",
        description: "Marketplace responsivo usando Flutter.",
        platform: "Web + Mobile",
        imageUrl: "https://via.placeholder.com/400x300",
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          const CustomHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                color: AppColors.background,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppTexts.portfolioTitle,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ResponsiveLayout(
                      mobileBody: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: projects.length,
                        itemBuilder: (context, index) {
                          return ProjectCard(project: projects[index]);
                        },
                      ),
                      desktopBody: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: projects.length,
                        itemBuilder: (context, index) {
                          return ProjectCard(project: projects[index]);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
