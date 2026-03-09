import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:regisse_business/screens/home_screen.dart';
import 'package:regisse_business/screens/menu_screen.dart';
import 'package:regisse_business/screens/locations_screen.dart';
import 'package:regisse_business/screens/blog_screen.dart';
import 'package:regisse_business/screens/contact_screen.dart';
import 'package:regisse_business/widgets/navbar.dart';
import 'package:regisse_business/widgets/footer.dart';
import 'package:regisse_business/constants/app_constants.dart';

void main() {
  runApp(const RegisseBusinessApp());
}

class RegisseBusinessApp extends StatefulWidget {
  const RegisseBusinessApp({super.key});

  @override
  State<RegisseBusinessApp> createState() => _RegisseBusinessAppState();
}

class _RegisseBusinessAppState extends State<RegisseBusinessApp> {
  Locale _locale = const Locale('en');

  void _onLocaleChanged(String code) {
    setState(() {
      _locale = Locale(code);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Regisse Business Solutions',
      locale: _locale,
      supportedLocales: const [Locale('en'), Locale('fr'), Locale('de')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        primaryColor: AppColors.primary,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MaterialColor(
            AppColors.primary.value,
            const {
              50: Color(0xFFEAE2F2),
              100: Color(0xFFCFC1E4),
              200: Color(0xFFB39FD6),
              300: Color(0xFF967DC8),
              400: Color(0xFF7A5BBA),
              500: AppColors.primary,
              600: Color(0xFF3D2476),
              700: Color(0xFF2F1A5A),
              800: Color(0xFF21103E),
              900: Color(0xFF130622),
            },
          ),
        ).copyWith(
          secondary: AppColors.accent,
          surface: AppColors.background,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          elevation: 0,
          centerTitle: false,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.primary.withOpacity(0.3)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.primary.withOpacity(0.3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.primary),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      home: MainLayout(onLocaleChanged: _onLocaleChanged, currentLocale: _locale),
    );
  }
}

class MainLayout extends StatefulWidget {
  final void Function(String) onLocaleChanged;
  final Locale currentLocale;

  const MainLayout({super.key, required this.onLocaleChanged, required this.currentLocale});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;
  bool _menuOpen = false;
  final PageController _pageController = PageController();

  // Opens the navigation bottom-sheet. Hides the footer while the sheet is
  // visible — same behavior as flutterWebsite.
  //
  // IMPORTANT: showMenu() must be called BEFORE setState so that
  // showModalBottomSheet receives the original, unmodified context.  On
  // Flutter Web, marking the tree dirty before pushing the route can silently
  // drop the sheet.
  void _openMenu(BuildContext ctx) {
    final future = NavBar.showMenu(
      ctx,
      currentIndex: _currentIndex,
      onItemSelected: (index) {
        if (!mounted) return;
        setState(() {
          _currentIndex = index;
          _menuOpen = false;
        });
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
    );
    // Hide footer now that the route is safely on the Navigator stack.
    if (mounted) setState(() => _menuOpen = true);
    future.then(
      (_) {
        if (mounted) setState(() => _menuOpen = false);
      },
      onError: (_) {
        if (mounted) setState(() => _menuOpen = false);
      },
    );
  }

  // Build screens here so we can pass navigation callbacks to HomeScreen
  List<Widget> get _screens => [
        HomeScreen(onNavigate: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        }),
        const MenuScreen(),
        const LocationsScreen(),
        const BlogScreen(),
        const ContactScreen(),
      ];

  final List<String> _appBarTitles = [
    'Regisse Business Solutions',
    'Our Services',
    'Locations',
    'Blog & Insights',
    'Contact Us',
  ];

  @override
  Widget build(BuildContext context) {
    // Wrapping in Builder gives us `shellCtx` — a context that is below the
    // MaterialApp (and therefore has a valid Navigator/Overlay ancestor) but
    // is NOT inside the AppBar widget tree.  Calling showModalBottomSheet from
    // an AppBar-internal context silently does nothing on Flutter web; using
    // shellCtx here fixes that.
    return Builder(
      builder: (shellCtx) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            tooltip: 'Menu',
            icon: const Icon(Icons.menu, color: AppColors.primary),
            onPressed: () => _openMenu(shellCtx),
          ),
          title: Text(
            _appBarTitles[_currentIndex],
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
          actions: [
            NavBar(
              currentIndex: _currentIndex,
              onItemSelected: (index) {
                setState(() {
                  _currentIndex = index;
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                });
              },
              onLocaleChanged: widget.onLocaleChanged,
              currentLocale: widget.currentLocale.languageCode,
            ),
          ],
        ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _screens,
      ),
      // Footer is hidden while the menu sheet is open (matches flutterWebsite
      // behavior where the footer is not visible during navigation).
      bottomNavigationBar: _menuOpen
          ? null
          : Footer(
              currentIndex: _currentIndex,
              isCompact: true,
              onTabTapped: (index) {
                setState(() {
                  _currentIndex = index;
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                });
              },
            ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Quick Navigate',
        backgroundColor: AppColors.primary,
        onPressed: () => _openMenu(shellCtx),
        child: const Icon(Icons.apps, color: Colors.white),
      ),
    ),
    );
  }
}