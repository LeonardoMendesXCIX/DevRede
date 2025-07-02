import 'package:flutter/material.dart';
import 'package:devrede_portfolio/constants/app_colors.dart';
import 'package:devrede_portfolio/constants/app_texts.dart';
import 'package:devrede_portfolio/screens/portfolio_screen.dart';
import 'package:devrede_portfolio/widgets/responsive_layout.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: AppBar(
        title: Text(
          AppTexts.appName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primary,
      ),
      desktopBody: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        color: AppColors.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppTexts.appName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                _navItem("Home", context),
                _navItem("Portfólio", context),
                _navItem("Serviços", context),
                _navItem("Contato", context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextButton(
        onPressed: () {
          if (title == "Portfólio") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PortfolioScreen()),
            );
          }
          // Adicione outras rotas conforme implementar as telas:
          // else if (title == "Contato") { ... }
        },
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
