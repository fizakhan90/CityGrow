import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const double _padding = 24.0;
  static const double _buttonPadding = 32.0;
  static const double _iconSize = 32.0;
  static const double _spacing = 20.0;
  static const double _cardPadding = 24.0;
  static const double _borderRadius = 16.0;

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
        vertical: _padding * 3,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.green.shade50,
            Colors.green.shade100,
          ],
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: _padding / 2,
              vertical: _padding / 4,
            ),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(_borderRadius * 2),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.eco,
                  size: 16,
                  color: Colors.green.shade700,
                ),
                const SizedBox(width: 8),
                Text(
                  '🌱 New: AI Plant Recognition',
                  style: TextStyle(
                    color: Colors.green.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: _spacing * 1.5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: _padding),
            child: Text(
              'Grow Your Urban Garden with AI',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Colors.green.shade900,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: _spacing),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: _padding),
            child: Text(
              'Transform any city space into a thriving garden. Upload a photo of your space and let our AI guide you to growing success.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey.shade700,
                    height: 1.5,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: _spacing * 2),
          Wrap(
            spacing: _spacing,
            runSpacing: _spacing,
            alignment: WrapAlignment.center,
            children: [
              _buildPrimaryButton(
                onPressed: () {},
                label: 'Start Growing',
                icon: Icons.arrow_forward,
                backgroundColor: Colors.green.shade600,
              ),
              _buildSecondaryButton(
                onPressed: () {},
                label: 'Watch Demo',
                icon: Icons.play_circle_outline,
              ),
            ],
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: _padding),
            child: Text(
              'How CityGrow Works',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.green.shade900,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: _spacing / 2),
          Text(
            'Get started in three simple steps',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: _spacing * 2),
          ..._buildFeatureCards(),
        ],
      ),
    );
  }

  Widget _buildFeaturesSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(_padding),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.green.shade50,
            Colors.green.shade100,
          ],
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: _padding),
            child: Text(
              'Smart Features for Better Growing',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.green.shade900,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: _spacing / 2),
          Text(
            'Everything you need to succeed',
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: _spacing * 2),
          _buildFeaturesGrid(),
        ],
      ),
    );
  }

  Widget _buildCTASection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(_padding * 1.5),
      decoration: BoxDecoration(
        color: Colors.green.shade900,
        image: const DecorationImage(
          image: NetworkImage('https://example.com/pattern.png'),
          opacity: 0.1,
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(_padding),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(_borderRadius),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: _padding),
                  child: Text(
                    'Ready to Start Growing?',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: _spacing),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: _padding),
                  child: Text(
                    'Join thousands of urban gardeners growing fresh food in their city spaces.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.green.shade50,
                          height: 1.5,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: _spacing * 1.5),
                _buildPrimaryButton(
                  onPressed: () {},
                  label: 'Get Started Free',
                  icon: Icons.arrow_forward,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.green.shade900,
                ),
              ],
            ),
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
        foregroundColor: foregroundColor ?? Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: _buttonPadding,
          vertical: _buttonPadding / 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        elevation: 0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          if (icon != null) ...[
            const SizedBox(width: _spacing / 2),
            Icon(icon),
          ],
        ],
      ),
    );
  }

  Widget _buildSecondaryButton({
    required VoidCallback onPressed,
    required String label,
    IconData? icon,
  }) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: _buttonPadding,
          vertical: _buttonPadding / 2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.green.shade900,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          if (icon != null) ...[
            const SizedBox(width: _spacing / 2),
            Icon(
              icon,
              color: Colors.green.shade900,
            ),
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

    return features
        .asMap()
        .entries
        .map((entry) => _FeatureCard(
              feature: entry.value,
              index: entry.key + 1,
            ))
        .toList();
  }

  Widget _buildFeaturesGrid() {
    final features = [
      (
        icon: Icons.analytics_outlined,
        title: 'Space Analysis',
        description:
            'Advanced computer vision analyzes light, space, and growing conditions.',
      ),
      (
        icon: Icons.psychology_outlined,
        title: 'Smart Recommendations',
        description:
            'Get personalized crop suggestions based on your space and experience level.',
      ),
      (
        icon: Icons.menu_book_outlined,
        title: 'Growing Guides',
        description:
            'Step-by-step instructions and care tips customized for your garden.',
      ),
      (
        icon: Icons.group_outlined,
        title: 'Community Support',
        description:
            'Connect with experienced gardeners and share your growing journey.',
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: constraints.maxWidth > 600 ? 2 : 1,
            crossAxisSpacing: _spacing,
            mainAxisSpacing: _spacing,
            childAspectRatio: constraints.maxWidth > 600 ? 1.1 : 1.3,
          ),
          itemCount: features.length,
          itemBuilder: (context, index) => _FeatureGridItem(feature: features[index]),
        );
      },
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.feature,
    required this.index,
  });

  final ({IconData icon, String title, String description}) feature;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: HomePage._spacing / 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(HomePage._borderRadius),
      ),
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(HomePage._cardPadding),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(HomePage._borderRadius),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(HomePage._cardPadding - 8),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(HomePage._borderRadius),
                  ),
                  child: Icon(
                    feature.icon,
                    color: Colors.green.shade700,
                    size: HomePage._iconSize,
                  ),
                ),
                const SizedBox(width: HomePage._spacing),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: HomePage._spacing / 2,
                    vertical: HomePage._spacing / 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(HomePage._borderRadius),
                  ),
                  child: Text(
                    'Step $index',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: HomePage._spacing),
            Text(
              feature.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: HomePage._spacing / 2),
            Text(
              feature.description,
              style: TextStyle(
                color: Colors.grey.shade600,
                height: 1.5,
              ),
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

  final ({IconData icon, String title, String description}) feature;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(HomePage._borderRadius),
      ),
      child: Container(
        padding: const EdgeInsets.all(HomePage._cardPadding),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(HomePage._borderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(HomePage._cardPadding - 8),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(HomePage._borderRadius / 2),
              ),
              child: Icon(
                feature.icon,
                color: Colors.green.shade700,
                size: 24,
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
              style: TextStyle(
                color: Colors.grey.shade600,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}