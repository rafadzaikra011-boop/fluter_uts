import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({required this.onContinue, super.key});

  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(18),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF8F3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const _FoodIllustration(),
                      const SizedBox(height: 32),
                      const Text(
                        'All your favorites',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF263238),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Get all your loved foods in one once place, '
                        'you just place the one we do the rest',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF78909C),
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: onContinue,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF36B32),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            'NEXT',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      TextButton(
                        onPressed: onContinue,
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFF78909C),
                        ),
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _FoodIllustration extends StatelessWidget {
  const _FoodIllustration();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.maxWidth < 270 ? constraints.maxWidth : 270.0;
        final imageSize = size * 0.78;

        return SizedBox(
          height: size,
          width: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: size * 0.88,
                width: size * 0.88,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFE6D5),
                  shape: BoxShape.circle,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(imageSize / 2),
                child: Image.network(
                  'https://images.unsplash.com/photo-1504674900247-0877df9cc836'
                  '?auto=format&fit=crop&w=700&q=85',
                  height: imageSize,
                  width: imageSize,
                  fit: BoxFit.cover,
                  semanticLabel: 'A table filled with delicious food',
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: imageSize,
                      width: imageSize,
                      color: const Color(0xFFFFD6B8),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.restaurant,
                        color: const Color(0xFFF36B32),
                        size: imageSize * 0.39,
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                right: 0,
                bottom: size * 0.07,
                child: _IllustrationBadge(
                  icon: Icons.delivery_dining,
                  backgroundColor: const Color(0xFFF36B32),
                  size: size * 0.21,
                ),
              ),
              Positioned(
                left: 0,
                top: size * 0.09,
                child: _IllustrationBadge(
                  icon: Icons.favorite,
                  backgroundColor: Colors.white,
                  iconColor: const Color(0xFFE95B4B),
                  size: size * 0.18,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _IllustrationBadge extends StatelessWidget {
  const _IllustrationBadge({
    required this.icon,
    required this.backgroundColor,
    this.iconColor = Colors.white,
    this.size = 58,
  });

  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Icon(icon, color: iconColor, size: size * 0.55),
    );
  }
}
