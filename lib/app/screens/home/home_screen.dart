import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const double _padding = 20.0;
  static const double _buttonPadding = 32.0;
  static const double _iconSize = 30.0;
  static const double _spacing = 16.0;
  static const double _cardPadding = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(context),
            _buildHowItWorksSection(context),
            _buildFeaturesSection(context),
            _buildCTASection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: _padding,
        vertical: _padding * 2,
      ),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
      ),
      child: Column(
        children: [
          Text(
            'Grow Your Urban Garden with AI',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.green.shade800,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: _spacing),
          Text(
            'Transform any city space into a thriving garden. Upload a photo of your space and let our AI guide you to growing success.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey.shade700,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: _spacing * 1.5),
          _buildPrimaryButton(
            onPressed: () {
            },
            label: 'Start Growing',
            icon: Icons.arrow_forward,
            backgroundColor: Colors.green.shade600,
          ),
        ],
      ),
    );
  }

  Widget _buildHowItWorksSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(_padding),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'How CityGrow Works',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.green.shade800,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: _spacing * 1.5),
          ..._buildFeatureCards(),
        ],
      ),
    );
  }

  Widget _buildFeaturesSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(_padding),
      color: Colors.green.shade50,
      child: Column(
        children: [
          Text(
            'Features to Help You Succeed',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.green.shade800,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: _spacing * 1.5),
          _buildFeaturesGrid(),
        ],
      ),
    );
  }

  Widget _buildCTASection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(_padding),
      color: Colors.green.shade800,
      child: Column(
        children: [
          Text(
            'Ready to Start Growing?',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: _spacing),
          Text(
            'Join thousands of urban gardeners growing fresh food in their city spaces.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.green.shade100,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: _spacing * 1.5),
          _buildPrimaryButton(
            onPressed: () {
        
            },
            label: 'Get Started Now',
            backgroundColor: Colors.white,
            foregroundColor: Colors.green.shade800,
          ),
        ],
      ),
    );
  }

  Widget _buildPrimaryButton({
    required VoidCallback onPressed,
    required String label,
    IconData? icon,
    required Color backgroundColor,
    Color? foregroundColor,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        padding: const EdgeInsets.symmetric(
          horizontal: _buttonPadding,
          vertical: _buttonPadding / 2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label),
          if (icon != null) ...[
            const SizedBox(width: _spacing / 2),
            Icon(icon),
          ],
        ],
      ),
    );
  }

  List<Widget> _buildFeatureCards() {
    final List<({IconData icon, String title, String description})> features = [
      (
        icon: Icons.camera_alt,
        title: 'Upload Your Space',
        description:
            "Take a photo of your growing area - whether it's a balcony, windowsill, or rooftop.",
      ),
      (
        icon: Icons.eco,
        title: 'Get AI Recommendations',
        description:
            'Our AI analyzes your space and suggests the best crops and growing locations.',
      ),
      (
        icon: Icons.people,
        title: 'Join the Community',
        description:
            'Connect with fellow urban gardeners, share tips, and grow together.',
      ),
    ];

    return features.map((feature) => _FeatureCard(feature: feature)).toList();
    
  }

  Widget _buildFeaturesGrid() {
    final features = [
      (
        title: 'Space Analysis',
        description:
            'Advanced computer vision analyzes light, space, and growing conditions.',
      ),
      (
        title: 'Smart Recommendations',
        description:
            'Get personalized crop suggestions based on your space and experience level.',
      ),
      (
        title: 'Growing Guides',
        description:
            'Step-by-step instructions and care tips customized for your garden.',
      ),
      (
        title: 'Community Support',
        description:
            'Connect with experienced gardeners and share your growing journey.',
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: _spacing,
        mainAxisSpacing: _spacing,
        childAspectRatio: 1.2,
      ),
      itemCount: features.length,
      itemBuilder: (context, index) => _FeatureGridItem(feature: features[index]),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.feature,
  });

  final ({IconData icon, String title, String description}) feature;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: HomePage._spacing / 2),
      child: Padding(
        padding: const EdgeInsets.all(HomePage._cardPadding),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(HomePage._cardPadding - 4),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                feature.icon,
                color: Colors.green.shade600,
                size: HomePage._iconSize,
              ),
            ),
            const SizedBox(height: HomePage._spacing),
            Text(
              feature.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: HomePage._spacing / 2),
            Text(
              feature.description,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureGridItem extends StatelessWidget {
  const _FeatureGridItem({
    required this.feature,
  });

  final ({String title, String description}) feature;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(HomePage._cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              feature.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: HomePage._spacing / 2),
            Text(
              feature.description,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}