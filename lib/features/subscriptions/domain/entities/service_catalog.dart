import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/gen/assets.gen.dart';
import 'package:flutter/material.dart';

enum ServiceCategory {
  entertainment(Icons.movie_rounded),
  productivity(Icons.work_rounded),
  cloud(Icons.cloud_rounded),
  ai(Icons.smart_toy_rounded),
  design(Icons.palette_rounded),
  development(Icons.code_rounded),
  social(Icons.people_rounded),
  shopping(Icons.shopping_bag_rounded),
  fitness(Icons.fitness_center_rounded),
  education(Icons.school_rounded),
  gaming(Icons.sports_esports_rounded),
  news(Icons.newspaper_rounded),
  finance(Icons.account_balance_rounded),
  lifestyle(Icons.spa_rounded),
  other(Icons.more_horiz_rounded);

  const ServiceCategory(this.icon);
  final IconData icon;

  String localizedLabel(AppLocalizations l10n) {
    return switch (this) {
      entertainment => l10n.categoryEntertainment,
      productivity => l10n.categoryProductivity,
      cloud => l10n.categoryCloud,
      ai => l10n.categoryAi,
      design => l10n.categoryDesign,
      development => l10n.categoryDevelopment,
      social => l10n.categorySocial,
      shopping => l10n.categoryShopping,
      fitness => l10n.categoryFitness,
      education => l10n.categoryEducation,
      gaming => l10n.categoryGaming,
      news => l10n.categoryNews,
      finance => l10n.categoryFinance,
      lifestyle => l10n.categoryLifestyle,
      other => l10n.categoryOther,
    };
  }
}

class ServicePlan {
  const ServicePlan({
    required this.name,
    required this.monthlyPrice,
  });

  final String name;
  final double monthlyPrice;
}

class CatalogService {
  const CatalogService({
    required this.id,
    required this.name,
    this.logo,
    required this.color,
    required this.category,
    this.plans = const [],
  });

  final String id;
  final String name;
  final AssetGenImage? logo;
  final Color color;
  final ServiceCategory category;
  final List<ServicePlan> plans;
}

const defaultServices = <CatalogService>[
  CatalogService(
    id: 'netflix',
    name: 'Netflix',
    logo: Assets.netflix,
    color: Color(0xFFE50914),
    category: ServiceCategory.entertainment,
    plans: [
      ServicePlan(name: 'Standard with Ads', monthlyPrice: 6.99),
      ServicePlan(name: 'Standard', monthlyPrice: 15.49),
      ServicePlan(name: 'Premium', monthlyPrice: 22.99),
    ],
  ),
  CatalogService(
    id: 'spotify',
    name: 'Spotify',
    logo: Assets.spotify,
    color: Color(0xFF1DB954),
    category: ServiceCategory.entertainment,
    plans: [
      ServicePlan(name: 'Individual', monthlyPrice: 11.99),
      ServicePlan(name: 'Duo', monthlyPrice: 16.99),
      ServicePlan(name: 'Family', monthlyPrice: 19.99),
      ServicePlan(name: 'Student', monthlyPrice: 5.99),
    ],
  ),
  CatalogService(
    id: 'amazon_prime',
    name: 'Amazon Prime',
    logo: Assets.amazon,
    color: Color(0xFF00A8E1),
    category: ServiceCategory.shopping,
    plans: [
      ServicePlan(name: 'Monthly', monthlyPrice: 14.99),
      ServicePlan(name: 'Annual', monthlyPrice: 11.58),
    ],
  ),
  CatalogService(
    id: 'disney_plus',
    name: 'Disney+',
    logo: Assets.disney,
    color: Color(0xFF113CCF),
    category: ServiceCategory.entertainment,
    plans: [
      ServicePlan(name: 'Basic', monthlyPrice: 7.99),
      ServicePlan(name: 'Premium', monthlyPrice: 13.99),
    ],
  ),
  CatalogService(
    id: 'youtube_premium',
    name: 'YouTube Premium',
    logo: Assets.youtube,
    color: Color(0xFFFF0000),
    category: ServiceCategory.entertainment,
    plans: [
      ServicePlan(name: 'Individual', monthlyPrice: 13.99),
      ServicePlan(name: 'Family', monthlyPrice: 22.99),
      ServicePlan(name: 'Student', monthlyPrice: 7.99),
    ],
  ),
  CatalogService(
    id: 'chatgpt_plus',
    name: 'ChatGPT Plus',
    logo: Assets.chatgpt,
    color: Color(0xFF10A37F),
    category: ServiceCategory.ai,
    plans: [
      ServicePlan(name: 'Plus', monthlyPrice: 20.00),
      ServicePlan(name: 'Pro', monthlyPrice: 200.00),
    ],
  ),
  CatalogService(
    id: 'notion',
    name: 'Notion',
    logo: Assets.notion,
    color: Color(0xFF787774),
    category: ServiceCategory.productivity,
    plans: [
      ServicePlan(name: 'Plus', monthlyPrice: 10.00),
      ServicePlan(name: 'Business', monthlyPrice: 18.00),
    ],
  ),
  CatalogService(
    id: 'apple_music',
    name: 'Apple Music',
    logo: Assets.apple,
    color: Color(0xFFFC3C44),
    category: ServiceCategory.entertainment,
    plans: [
      ServicePlan(name: 'Voice', monthlyPrice: 4.99),
      ServicePlan(name: 'Student', monthlyPrice: 5.99),
      ServicePlan(name: 'Individual', monthlyPrice: 10.99),
      ServicePlan(name: 'Family', monthlyPrice: 16.99),
    ],
  ),
  CatalogService(
    id: 'icloud',
    name: 'iCloud+',
    logo: Assets.icloud,
    color: Color(0xFF3693F3),
    category: ServiceCategory.cloud,
    plans: [
      ServicePlan(name: '50 GB', monthlyPrice: 0.99),
      ServicePlan(name: '200 GB', monthlyPrice: 2.99),
      ServicePlan(name: '2 TB', monthlyPrice: 9.99),
      ServicePlan(name: '6 TB', monthlyPrice: 29.99),
      ServicePlan(name: '12 TB', monthlyPrice: 59.99),
    ],
  ),
  CatalogService(
    id: 'hbo_max',
    name: 'Max (HBO)',
    logo: Assets.hbo,
    color: Color(0xFF002BE7),
    category: ServiceCategory.entertainment,
    plans: [
      ServicePlan(name: 'With Ads', monthlyPrice: 9.99),
      ServicePlan(name: 'Ad-Free', monthlyPrice: 16.99),
      ServicePlan(name: 'Ultimate Ad-Free', monthlyPrice: 20.99),
    ],
  ),
  CatalogService(
    id: 'hulu',
    name: 'Hulu',
    logo: Assets.hulu,
    color: Color(0xFF1CE783),
    category: ServiceCategory.entertainment,
    plans: [
      ServicePlan(name: 'With Ads', monthlyPrice: 7.99),
      ServicePlan(name: 'No Ads', monthlyPrice: 17.99),
    ],
  ),
  CatalogService(
    id: 'adobe_cc',
    name: 'Adobe Creative Cloud',
    logo: Assets.adobe,
    color: Color(0xFFFF0000),
    category: ServiceCategory.design,
    plans: [
      ServicePlan(name: 'Photography', monthlyPrice: 9.99),
      ServicePlan(name: 'Single App', monthlyPrice: 22.99),
      ServicePlan(name: 'All Apps', monthlyPrice: 59.99),
    ],
  ),
  CatalogService(
    id: 'microsoft_365',
    name: 'Microsoft 365',
    logo: Assets.microsoft,
    color: Color(0xFFD83B01),
    category: ServiceCategory.productivity,
    plans: [
      ServicePlan(name: 'Personal', monthlyPrice: 6.99),
      ServicePlan(name: 'Family', monthlyPrice: 9.99),
    ],
  ),
  CatalogService(
    id: 'dropbox',
    name: 'Dropbox',
    logo: Assets.dropbox,
    color: Color(0xFF0061FF),
    category: ServiceCategory.cloud,
    plans: [
      ServicePlan(name: 'Plus', monthlyPrice: 11.99),
      ServicePlan(name: 'Essentials', monthlyPrice: 22.00),
      ServicePlan(name: 'Business', monthlyPrice: 15.00),
    ],
  ),
  CatalogService(
    id: 'linkedin_premium',
    name: 'LinkedIn Premium',
    logo: Assets.linkedin,
    color: Color(0xFF0A66C2),
    category: ServiceCategory.social,
    plans: [
      ServicePlan(name: 'Career', monthlyPrice: 29.99),
      ServicePlan(name: 'Business', monthlyPrice: 59.99),
    ],
  ),
  CatalogService(
    id: 'github_copilot',
    name: 'GitHub Copilot',
    logo: Assets.copilot,
    color: Color(0xFF6E40C9),
    category: ServiceCategory.development,
    plans: [
      ServicePlan(name: 'Individual', monthlyPrice: 10.00),
      ServicePlan(name: 'Business', monthlyPrice: 19.00),
    ],
  ),
  CatalogService(
    id: 'figma',
    name: 'Figma',
    logo: Assets.figma,
    color: Color(0xFFA259FF),
    category: ServiceCategory.design,
    plans: [
      ServicePlan(name: 'Professional', monthlyPrice: 15.00),
      ServicePlan(name: 'Organization', monthlyPrice: 45.00),
    ],
  ),
];
