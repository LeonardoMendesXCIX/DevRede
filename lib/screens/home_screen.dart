import 'package:flutter/material.dart';
import 'package:devrede_portfolio/widgets/header.dart';
import 'package:devrede_portfolio/constants/app_colors.dart';
import 'package:devrede_portfolio/constants/app_texts.dart';
import 'package:devrede_portfolio/widgets/responsive_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: ResponsiveLayout(
                mobileBody: _buildMobileBody(),
                floatingActionButton: FloatingActionButton(
  onPressed: () {},
  backgroundColor: AppColors.primary,
  child: const Icon(Icons.chat),
),
                desktopBody: _buildDesktopBody(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileBody() {
    return Column(
      children: [
        _buildHeroSection(),
        _buildServicesSection(),
        _buildPortfolioSection(),
        floatingActionButton: FloatingActionButton(
  onPressed: () {},
  backgroundColor: AppColors.primary,
  child: const Icon(Icons.chat),
),
      ],
    );
  }

  Widget _buildDesktopBody() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          _buildHeroSection(),
          _buildServicesSection(),
          _buildPortfolioSection(),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: AppColors.background,
      child: Column(
        children: [
          const CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage('<https://via.placeholder.com/150>'),
          ),
          const SizedBox(height: 20),
          Text(
            AppTexts.appName,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 10),
          Text(
            AppTexts.slogan,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.servicesTitle,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 20),
          ResponsiveLayout(
            mobileBody: _buildServicesGrid(1),
            desktopBody: _buildServicesGrid(4),
          )
        ],
      ),
    );
  }

  Widget _buildServicesGrid(int crossAxisCount) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: crossAxisCount,
      children: AppTexts.services.map((service) {
        return Card(
          color: AppColors.cardColor,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.code, size: 40, color: AppColors.primary),
                const SizedBox(height: 10),
                Text(
                  service,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPortfolioSection() {
    // Implementação com dados mockados
    final projects = [
      Project(
        title: "App de Finanças",
        description: "Aplicativo de gerenciamento financeiro para iOS e Android",
        platform: "Mobile",
        imageUrl: "<https://via.placeholder.com/300>"
      ),
      Project(
        title: "E-commerce",
        description: "Plataforma de e-commerce responsiva",
        platform: "Web",
        imageUrl: "<https://via.placeholder.com/300>"
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      color: AppColors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.portfolioTitle,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 20),
          ResponsiveLayout(
            mobileBody: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: projects.length,
              itemBuilder: (context, index) => ProjectCard(project: projects[index]),
            ),
            desktopBody: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.8,
              ),
              itemCount: projects.length,
              itemBuilder: (context, index) => ProjectCard(project: projects[index]),
            ),
          )
        ],
      ),
    );
  }
}
