import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final compact = width < 700;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.restaurant_menu_rounded, color: Color(0xFF246B5B)),
            SizedBox(width: 10),
            Text('CampusEats', style: TextStyle(fontWeight: FontWeight.w800)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/login'),
            child: const Text('Log in'),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: compact ? 22 : 64,
            vertical: 36,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(compact ? 26 : 54),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE4F1EB),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Flex(
                    direction: compact ? Axis.vertical : Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExpandedIfWide(
                        wide: !compact,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Text(
                                'YOUR CAMPUS FOOD COMPANION',
                                style: TextStyle(
                                  color: Color(0xFF246B5B),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1.1,
                                ),
                              ),
                            ),
                            const SizedBox(height: 22),
                            Text(
                              'Good food.\nMade easy.',
                              style: TextStyle(
                                fontSize: compact ? 42 : 60,
                                height: 1.05,
                                fontWeight: FontWeight.w900,
                                color: const Color(0xFF183D34),
                              ),
                            ),
                            const SizedBox(height: 18),
                            const Text(
                              'Discover a simple way to explore campus meals and local food choices. This is the starter home page for our Flutter Web project.',
                              style: TextStyle(fontSize: 16, height: 1.6, color: Color(0xFF45635A)),
                            ),
                            const SizedBox(height: 26),
                            FilledButton.icon(
                              onPressed: () => Navigator.pushNamed(context, '/login'),
                              icon: const Icon(Icons.login_rounded),
                              label: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                                child: Text('Get started'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (!compact) const SizedBox(width: 36),
                      if (!compact)
                        const Expanded(
                          child: Center(
                            child: Icon(Icons.ramen_dining_rounded, size: 210, color: Color(0xFF246B5B)),
                          ),
                        ),
                      if (compact)
                        const Padding(
                          padding: EdgeInsets.only(top: 24),
                          child: Center(
                            child: Icon(Icons.ramen_dining_rounded, size: 120, color: Color(0xFF246B5B)),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 34),
                const Text('What you can do', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: const [
                    FeatureCard(icon: Icons.search_rounded, title: 'Explore choices', description: 'A future place to browse meals and local sellers.'),
                    FeatureCard(icon: Icons.shopping_bag_outlined, title: 'Plan an order', description: 'A starting point for a future ordering workflow.'),
                    FeatureCard(icon: Icons.devices_rounded, title: 'Web ready', description: 'Built with Flutter and responsive layouts.'),
                  ],
                ),
                const SizedBox(height: 32),
                const Center(
                  child: Text('Activity 8 • Flutter Web Starter UI', style: TextStyle(color: Colors.black54)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandedIfWide extends StatelessWidget {
  const ExpandedIfWide({super.key, required this.wide, required this.child});
  final bool wide;
  final Widget child;

  @override
  Widget build(BuildContext context) => wide ? Expanded(child: child) : child;
}

class FeatureCard extends StatelessWidget {
  const FeatureCard({super.key, required this.icon, required this.title, required this.description});
  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color(0xFFE3EAE6)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 30, color: const Color(0xFF246B5B)),
              const SizedBox(height: 16),
              Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 17)),
              const SizedBox(height: 8),
              Text(description, style: const TextStyle(height: 1.5, color: Colors.black54)),
            ],
          ),
        ),
      ),
    );
  }
}
