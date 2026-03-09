// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:regisse_business/constants/app_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:regisse_business/models/service.dart';
import 'package:regisse_business/widgets/service_card.dart';
import 'package:regisse_business/widgets/advanced_cube_animation.dart';

class HomeScreen extends StatelessWidget {
  final void Function(int) onNavigate;

  const HomeScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Hero Section
          _buildHeroSection(context),

          // Value Pillars — ported from flutterWebsite GetStarted block
          _buildValuePillarsSection(context),

          // Services Preview
          _buildServicesSection(context),

          // Expertise Feature Cards — ported from flutterWebsite Features block
          _buildFeaturesSection(context),

          // Services Showcase — alternating image/text panels
          _buildServicesShowcaseSection(context),

          // Process Steps — ported from flutterWebsite ProcessSteps block
          _buildProcessStepsSection(context),

          // Stats Section — gradient style ported from flutterWebsite StatsRow
          _buildStatsSection(context),

          // Testimonials — star-rating cards ported from flutterWebsite
          _buildTestimonialsSection(context),

          // CTA Section — dark style ported from flutterWebsite InstallFlutter
          _buildCTASection(context),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      height: 600,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary.withOpacity(0.9),
            AppColors.primary.withOpacity(0.7),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Background Image with overlay
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.pexels.com/photos/2260237/pexels-photo-2260237.jpeg',
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  AppColors.primary.withOpacity(0.6),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          
          // Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.readyToTransform,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: MediaQuery.of(context).size.width < 768 ? 32 : 48,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Digital solutions for governments, retail, and hospitality sectors\nacross Africa with mobile-first approach',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.9),
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => onNavigate(1),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.exploreServices,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      OutlinedButton(
                        onPressed: () => onNavigate(4),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.contactUs,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Value Pillars ──────────────────────────────────────────────────────────
  // Ported from flutterWebsite's GetStarted block: three compact stat/value
  // cards that highlight key differentiators below the hero.
  Widget _buildValuePillarsSection(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 900;
    final pillars = [
      {
        'icon': Icons.rocket_launch_outlined,
        'stat': '4 Weeks',
        'label': 'From brief to production',
      },
      {
        'icon': Icons.verified_user_outlined,
        'stat': '100% GDPR',
        'label': 'Security & compliance guaranteed',
      },
      {
        'icon': Icons.trending_up,
        'stat': 'ROI Day+30',
        'label': 'Measurable results from month 1',
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 56),
      child: Column(
        children: [
          // Origin badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '🇩🇪  Made in Germany  •  Powered by Flutter',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 28),
          Text(
            'Transform your ideas into\nhigh-performance digital solutions',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'From design to deployment in weeks — secure, scalable SaaS platforms\n'
            'built to accelerate your growth.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: AppColors.textLight,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 40),
          // Three value pillars
          isWide
              ? Row(
                  children: pillars.map((p) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: _ValuePillarCard(
                          icon: p['icon'] as IconData,
                          stat: p['stat'] as String,
                          label: p['label'] as String,
                        ),
                      ),
                    );
                  }).toList(),
                )
              : Column(
                  children: pillars.map((p) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _ValuePillarCard(
                        icon: p['icon'] as IconData,
                        stat: p['stat'] as String,
                        label: p['label'] as String,
                      ),
                    );
                  }).toList(),
                ),
          const SizedBox(height: 40),
          // CTA buttons
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 12,
            children: [
              ElevatedButton.icon(
                onPressed: () => onNavigate(4),
                icon: const Icon(Icons.arrow_forward, size: 18),
                label: Text(
                  'Start My Project',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () => onNavigate(1),
                icon: const Icon(Icons.play_circle_outline, size: 20),
                label: Text(
                  'View Our Work',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: const BorderSide(color: AppColors.primary, width: 1.5),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            '✓ No upfront commitment   ✓ Dedicated support   ✓ Continuous delivery',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: AppColors.textLight,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection(BuildContext context) {
    final services = Service.sampleServices.take(3).toList();
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: AppColors.background,
      child: Column(
        children: [
          const AdvancedCubeAnimation(size: 150),
          const SizedBox(height: 40),

          Text(
            'Our Core Solutions',
            style: GoogleFonts.poppins(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Tailored for African markets and business environments',
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: AppColors.textLight,
            ),
          ),
          const SizedBox(height: 50),
          
          // RESPONSIVE SERVICES GRID
          if (screenWidth >= 1024)
            // Desktop - 3 columns in Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: services.map((service) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ServiceCard(service: service),
                  ),
                );
              }).toList(),
            )
          else if (screenWidth >= 768)
            // Tablet - 2 columns in GridView
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.85,
              ),
              itemCount: services.length,
              itemBuilder: (context, index) {
                return ServiceCard(service: services[index]);
              },
            )
          else
            // Mobile - Carousel
            SizedBox(
              height: 450,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 450,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.85,
                ),
                items: services.map((service) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ServiceCard(service: service),
                  );
                }).toList(),
              ),
            ),
          
          const SizedBox(height: 40),
          TextButton(
            onPressed: () => onNavigate(1),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'View All Services',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward, color: AppColors.primary),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Expertise Feature Cards ────────────────────────────────────────────────
  // Ported from flutterWebsite's Features block: three feature cards with
  // tag badges, accent-coloured dividers, and a "learn more" link.
  Widget _buildFeaturesSection(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 1024;
    final features = [
      {
        'icon': Icons.speed_outlined,
        'tag': 'Delivery',
        'title': 'Rapid Deployment',
        'description':
            'From idea to production in a matter of weeks. Our short agile cycles '
            'let you validate, iterate and launch before competitors — without '
            'cutting corners on quality or security.',
        'link': 'Our method →',
      },
      {
        'icon': Icons.palette_outlined,
        'tag': 'Design',
        'title': 'Expressive & Flexible UI',
        'description':
            'Every interface is crafted for the end user. We combine Material Design, '
            'smooth animations and custom visual identity to deliver a memorable '
            'experience across all devices.',
        'link': 'See our mockups →',
      },
      {
        'icon': Icons.tune_outlined,
        'tag': 'Custom',
        'title': 'Tailored to Your Market',
        'description':
            'No generic templates — each solution is built around your business '
            'processes, your sector, and your growth objectives. You keep control; '
            'we bring the engineering.',
        'link': 'Our sectors →',
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 80 : 24,
        vertical: isWide ? 72 : 48,
      ),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'OUR EXPERTISE',
              style: GoogleFonts.poppins(
                fontSize: 11,
                color: AppColors.primary,
                letterSpacing: 1.4,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'Everything your digital business needs',
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'Three pillars — speed, design and custom-fit — to turn\n'
            'your vision into an operational product.',
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: AppColors.textLight,
              height: 1.7,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 56),
          isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: features.map((f) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: _FeatureCard(
                          icon: f['icon'] as IconData,
                          tag: f['tag'] as String,
                          title: f['title'] as String,
                          description: f['description'] as String,
                          linkLabel: f['link'] as String,
                        ),
                      ),
                    );
                  }).toList(),
                )
              : Column(
                  children: features.map((f) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: _FeatureCard(
                        icon: f['icon'] as IconData,
                        tag: f['tag'] as String,
                        title: f['title'] as String,
                        description: f['description'] as String,
                        linkLabel: f['link'] as String,
                      ),
                    );
                  }).toList(),
                ),
          const SizedBox(height: 48),
          OutlinedButton.icon(
            onPressed: () => onNavigate(1),
            icon: const Icon(Icons.arrow_forward, size: 18),
            label: Text(
              'Discover all our services',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primary,
              side: const BorderSide(color: AppColors.primary, width: 1.5),
              padding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 36),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Services Showcase ──────────────────────────────────────────────────────
  // Ported from flutterWebsite's ServicesShowcase: alternating image/text
  // panels that detail the main service categories.
  Widget _buildServicesShowcaseSection(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    final panels = [
      {
        'tag': 'SAAS & CLOUD',
        'title': 'Custom SaaS\nPlatforms',
        'description':
            'We design and build robust SaaS platforms adapted to your business '
            'processes. From multi-tenant authentication to analytics dashboards, '
            'every feature is tailored for your sector and users.',
        'link': 'View our SaaS solutions →',
        'image':
            'https://images.pexels.com/photos/159888/pexels-photo-159888.jpeg',
        'imageOnLeft': false,
      },
      {
        'tag': 'DESIGN & UX',
        'title': 'Interfaces Built\nto Convert',
        'description':
            'User-centred design, rapid prototyping and A/B testing. Every screen '
            'is crafted to reduce friction, increase engagement and express your '
            'brand identity — from wireframe to final pixel.',
        'link': 'Explore our design approach →',
        'image':
            'https://images.pexels.com/photos/196644/pexels-photo-196644.jpeg',
        'imageOnLeft': true,
      },
      {
        'tag': 'INTERNATIONAL EXPANSION',
        'title': 'Solutions for\nGlobal Markets',
        'description':
            'Present in Germany, France and West Africa, we help clients launch '
            'products adapted to multi-cultural markets. Localisation, local '
            'regulation and distributed infrastructure — we handle the complexity.',
        'link': 'Discover our markets →',
        'image':
            'https://images.pexels.com/photos/669610/pexels-photo-669610.jpeg',
        'imageOnLeft': false,
      },
    ];

    return Column(
      children: panels.map((p) {
        final imageOnLeft = p['imageOnLeft'] as bool;
        final imageWidget = ClipRRect(
          borderRadius:
              isDesktop ? BorderRadius.zero : BorderRadius.circular(12),
          child: Image.network(
            p['image'] as String,
            fit: BoxFit.cover,
            height: isDesktop ? 360 : 200,
            width: double.infinity,
            loadingBuilder: (ctx, child, progress) {
              if (progress == null) return child;
              return Container(
                height: isDesktop ? 360 : 200,
                color: AppColors.accent.withOpacity(0.2),
                child: const Center(child: CircularProgressIndicator()),
              );
            },
            errorBuilder: (ctx, _, __) => Container(
              height: isDesktop ? 360 : 200,
              color: AppColors.accent.withOpacity(0.2),
              child:
                  const Icon(Icons.image_outlined, size: 48, color: AppColors.primary),
            ),
          ),
        );

        final textWidget = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.accent.withOpacity(0.4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                p['tag'] as String,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.9,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              p['title'] as String,
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: 32,
              height: 2,
              color: AppColors.primary,
              margin: const EdgeInsets.only(bottom: 16),
            ),
            Text(
              p['description'] as String,
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: AppColors.textLight,
                height: 1.75,
              ),
            ),
            const SizedBox(height: 24),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => onNavigate(1),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      p['link'] as String,
                      style: GoogleFonts.poppins(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.arrow_forward,
                        color: AppColors.primary, size: 14),
                  ],
                ),
              ),
            ),
          ],
        );

        if (!isDesktop) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imageWidget,
                const SizedBox(height: 28),
                textWidget,
              ],
            ),
          );
        }

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: imageOnLeft
                  ? [
                      Expanded(flex: 5, child: imageWidget),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(48),
                          child: textWidget,
                        ),
                      ),
                    ]
                  : [
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(48),
                          child: textWidget,
                        ),
                      ),
                      Expanded(flex: 5, child: imageWidget),
                    ],
            ),
          ),
        );
      }).toList(),
    );
  }

  // ── Process Steps ──────────────────────────────────────────────────────────
  // Ported from flutterWebsite's ProcessSteps block: four numbered step cards
  // that explain the delivery process.
  Widget _buildProcessStepsSection(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 1024;
    final steps = [
      {
        'number': '01',
        'icon': Icons.lightbulb_outline,
        'title': 'Discovery & Strategy',
        'description':
            'Scoping workshop to understand your business needs, users and growth '
            'objectives. Deliverable: full requirements specification.',
      },
      {
        'number': '02',
        'icon': Icons.design_services_outlined,
        'title': 'Design & Architecture',
        'description':
            'Interactive mockups and cloud architecture validated together before '
            'writing the first line of code.',
      },
      {
        'number': '03',
        'icon': Icons.code_outlined,
        'title': 'Agile Development',
        'description':
            'Two-week sprints with a demo at each iteration. You validate, we '
            'progress — no surprises at delivery.',
      },
      {
        'number': '04',
        'icon': Icons.rocket_launch_outlined,
        'title': 'Deployment & Support',
        'description':
            'Secure production release, continuous monitoring and post-launch '
            'support so your product performs from Day 1.',
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 80 : 24,
        vertical: isWide ? 72 : 48,
      ),
      color: const Color(0xFFF7F9FC),
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'OUR METHOD',
              style: GoogleFonts.poppins(
                fontSize: 11,
                color: AppColors.primary,
                letterSpacing: 1.4,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'From idea to product in 4 steps',
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'A proven, transparent process designed to minimise risk\n'
            'while maximising delivery velocity.',
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: AppColors.textLight,
              height: 1.7,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 56),
          isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: steps.map((s) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: _StepCard(
                          number: s['number'] as String,
                          icon: s['icon'] as IconData,
                          title: s['title'] as String,
                          description: s['description'] as String,
                        ),
                      ),
                    );
                  }).toList(),
                )
              : Column(
                  children: steps.map((s) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _StepCard(
                        number: s['number'] as String,
                        icon: s['icon'] as IconData,
                        title: s['title'] as String,
                        description: s['description'] as String,
                      ),
                    );
                  }).toList(),
                ),
        ],
      ),
    );
  }

  // ── Stats Row ─────────────────────────────────────────────────────────────
  // Enhanced with a left-to-right gradient background — ported from
  // flutterWebsite's StatsRow block.
  Widget _buildStatsSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    const stats = [
      {'value': '50+', 'label': 'Projects Delivered'},
      {'value': '4', 'label': 'Countries Covered'},
      {'value': '98%', 'label': 'Client Satisfaction'},
      {'value': '<4 wks', 'label': 'Time to Market'},
    ];

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0A3D8F), AppColors.primary],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 48,
      ),
      child: isMobile
          ? GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 32,
              childAspectRatio: 1.4,
              children: stats.map((s) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      s['value']!,
                      style: GoogleFonts.poppins(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      s['label']!,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.white70,
                        letterSpacing: 0.8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              }).toList(),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: stats.map((s) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      s['value']!,
                      style: GoogleFonts.poppins(
                        fontSize: 42,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      s['label']!,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.white70,
                        letterSpacing: 0.8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              }).toList(),
            ),
    );
  }

  // ── Testimonials ──────────────────────────────────────────────────────────
  // Enhanced with star-rating rows and large opening-quote typographic mark —
  // ported from flutterWebsite's Testimonials block.
  Widget _buildTestimonialsSection(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 1024;
    const testimonials = [
      {
        'quote':
            'Regisse transformed our government services vision into a concrete '
            'product in under 6 weeks. The team combines technical rigour and '
            'business understanding — exactly what we needed to launch on the '
            'African market.',
        'name': 'Kwame Mensah',
        'role': 'Minister of Digitalization',
        'company': 'Ghana',
        'initials': 'KM',
        'color': Color(0xFF1565C0),
      },
      {
        'quote':
            'Our hotel booking platform was outdated. Regisse completely '
            'rethought it while preserving the existing business logic. Result: '
            '+34% conversions in the very first month.',
        'name': 'Amina Diallo',
        'role': 'CEO',
        'company': 'Hotel Royale Senegal',
        'initials': 'AD',
        'color': Color(0xFF00897B),
      },
      {
        'quote':
            'What convinced me was their structured approach: a serious scoping '
            'workshop, mockups validated before any development, and punctual '
            'deliveries at every sprint.',
        'name': 'Chukwu Emeka',
        'role': 'CTO',
        'company': 'LogiSoft Africa',
        'initials': 'CE',
        'color': Color(0xFFE65100),
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 80 : 24,
        vertical: isWide ? 72 : 48,
      ),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'WHAT THEY SAY',
              style: GoogleFonts.poppins(
                fontSize: 11,
                color: AppColors.primary,
                letterSpacing: 1.4,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'Our clients\' trust,\nour best reference',
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 56),
          isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: testimonials.map((t) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: _TestimonialCard(
                          quote: t['quote'] as String,
                          name: t['name'] as String,
                          role: t['role'] as String,
                          company: t['company'] as String,
                          initials: t['initials'] as String,
                          avatarColor: t['color'] as Color,
                        ),
                      ),
                    );
                  }).toList(),
                )
              : Column(
                  children: testimonials.map((t) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: _TestimonialCard(
                        quote: t['quote'] as String,
                        name: t['name'] as String,
                        role: t['role'] as String,
                        company: t['company'] as String,
                        initials: t['initials'] as String,
                        avatarColor: t['color'] as Color,
                      ),
                    );
                  }).toList(),
                ),
        ],
      ),
    );
  }

  // ── CTA Section ───────────────────────────────────────────────────────────
  // Dark background CTA ported from flutterWebsite's InstallFlutter block.
  Widget _buildCTASection(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF0D1B2A),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 64),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 780),
          child: Column(
            children: [
              // Eyebrow badge
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: AppColors.primary.withOpacity(0.4)),
                ),
                child: Text(
                  'READY TO LAUNCH?',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: const Color(0xFF7DC8FD),
                    letterSpacing: 1.4,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Let's start your project together",
                style: GoogleFonts.poppins(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'A 30-minute call is enough to lay the foundations of your '
                'next digital solution. No commitment required.',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color(0xFFB0BEC5),
                  height: 1.7,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // CTA buttons
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 16,
                runSpacing: 12,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => onNavigate(4),
                    icon: const Icon(Icons.calendar_today_outlined,
                        size: 18),
                    label: Text(
                      'Book a Consultation',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () => onNavigate(1),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFFB0BEC5),
                      side: const BorderSide(
                          color: Color(0xFF4A6F8A), width: 1.5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'View Our Work',
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Trust badges
              Text(
                '✓ Reply within 24h   ✓ Free quote   ✓ Dedicated team',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: const Color(0xFF607D8B),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Private helper widgets ────────────────────────────────────────────────────

class _ValuePillarCard extends StatelessWidget {
  final IconData icon;
  final String stat;
  final String label;

  const _ValuePillarCard({
    required this.icon,
    required this.stat,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.accent.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.primary, size: 32),
          const SizedBox(height: 10),
          Text(
            stat,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: AppColors.textLight,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String tag;
  final String title;
  final String description;
  final String linkLabel;

  const _FeatureCard({
    required this.icon,
    required this.tag,
    required this.title,
    required this.description,
    required this.linkLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFBFD),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon circle
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.4),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Icon(icon, color: AppColors.primary, size: 28),
          ),
          const SizedBox(height: 20),
          // Tag badge
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              tag,
              style: GoogleFonts.poppins(
                fontSize: 11,
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.8,
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Title
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 8),
          // Accent divider
          Container(
            width: 32,
            height: 2,
            color: AppColors.primary,
            margin: const EdgeInsets.only(bottom: 14),
          ),
          // Description
          Text(
            description,
            style: GoogleFonts.poppins(
              fontSize: 14,
              height: 1.7,
              color: const Color(0xFF5A5F63),
            ),
          ),
          const SizedBox(height: 20),
          // Learn more link
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              linkLabel,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StepCard extends StatelessWidget {
  final String number;
  final IconData icon;
  final String title;
  final String description;

  const _StepCard({
    required this.number,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                number,
                style: GoogleFonts.poppins(
                  fontSize: 36,
                  color: AppColors.accent.withOpacity(0.6),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.accent.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: AppColors.primary, size: 22),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            width: 28,
            height: 2,
            color: AppColors.primary,
            margin: const EdgeInsets.only(bottom: 10),
          ),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: GoogleFonts.poppins(
              fontSize: 13,
              height: 1.7,
              color: const Color(0xFF5A5F63),
            ),
          ),
        ],
      ),
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  final String quote;
  final String name;
  final String role;
  final String company;
  final String initials;
  final Color avatarColor;

  const _TestimonialCard({
    required this.quote,
    required this.name,
    required this.role,
    required this.company,
    required this.initials,
    required this.avatarColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Star rating row
          Row(
            children: List.generate(
              5,
              (_) => const Padding(
                padding: EdgeInsets.only(right: 3),
                child: Icon(Icons.star,
                    color: Color(0xFFF59E0B), size: 16),
              ),
            ),
          ),
          const SizedBox(height: 14),
          // Opening quote mark
          Text(
            '\u201C',
            style: GoogleFonts.poppins(
              fontSize: 48,
              color: AppColors.primary,
              height: 0.8,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            quote,
            style: GoogleFonts.poppins(
              fontSize: 14,
              height: 1.75,
              color: const Color(0xFF4A4A4A),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: avatarColor,
                child: Text(
                  initials,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: AppColors.textDark,
                    ),
                  ),
                  Text(
                    '$role · $company',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppColors.textLight,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
