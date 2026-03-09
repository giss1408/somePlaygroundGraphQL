import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:regisse_business/constants/app_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBar extends StatefulWidget {
  final void Function(int) onItemSelected;
  final void Function(String)? onLocaleChanged;
  final String currentLocale;
  // Kept in sync with MainLayout's PageView so active states are always correct.
  final int currentIndex;

  NavBar({
    super.key,
    required this.onItemSelected,
    required this.currentIndex,
    this.onLocaleChanged,
    this.currentLocale = 'en',
  });

  // ── Static helper ────────────────────────────────────────────────────────
  // All navigation bottom-sheet logic lives here, inside flutter_web's NavBar.
  // Call this with a context that has a valid Navigator ancestor (e.g. the
  // shellCtx from a Builder wrapping the Scaffold, or any Scaffold descendant).
  static Future<void> showMenu(
    BuildContext context, {
    required int currentIndex,
    required void Function(int) onItemSelected,
  }) {
    final l10n = AppLocalizations.of(context);
    final navItems = [
      {'label': l10n?.home ?? 'Home', 'icon': Icons.home},
      {'label': l10n?.services ?? 'Services', 'icon': Icons.business_center},
      {'label': l10n?.locations ?? 'Locations', 'icon': Icons.location_on},
      {'label': l10n?.blog ?? 'Blog', 'icon': Icons.article},
      {'label': l10n?.contact ?? 'Contact', 'icon': Icons.contact_mail},
    ];

    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return Padding(
          // Ensure the sheet clears the on-screen keyboard.
          padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Menu',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(ctx),
                      icon: const Icon(Icons.close, color: AppColors.primary),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Nav items
                ...List.generate(navItems.length, (index) {
                  final isActive = currentIndex == index;
                  return ListTile(
                    leading: Icon(
                      navItems[index]['icon'] as IconData,
                      color: isActive ? AppColors.primary : AppColors.textLight,
                    ),
                    title: Text(
                      navItems[index]['label'] as String,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                        color: isActive ? AppColors.primary : AppColors.textDark,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(ctx);
                      onItemSelected(index);
                    },
                  );
                }),
                const SizedBox(height: 16),
                // "Get Started" CTA — goes to Contact
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                      onItemSelected(4);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      l10n?.contactUs ?? 'Get Started',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<Map<String, dynamic>> _navItems(BuildContext context) => [
        {'label': AppLocalizations.of(context)!.home, 'icon': Icons.home},
        {'label': AppLocalizations.of(context)!.services, 'icon': Icons.business_center},
        {'label': AppLocalizations.of(context)!.locations, 'icon': Icons.location_on},
        {'label': AppLocalizations.of(context)!.blog, 'icon': Icons.article},
        {'label': AppLocalizations.of(context)!.contact, 'icon': Icons.contact_mail},
      ];

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 768;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (isDesktop)
            // Desktop: horizontal text-button nav links
            Row(
              children: List.generate(_navItems(context).length, (index) {
                final isActive = widget.currentIndex == index;
                final label = _navItems(context)[index]['label'] as String;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextButton(
                    onPressed: () => widget.onItemSelected(index),
                    style: TextButton.styleFrom(
                      foregroundColor:
                          isActive ? AppColors.primary : AppColors.textLight,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(
                      label,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight:
                            isActive ? FontWeight.w600 : FontWeight.w400,
                      ),
                    ),
                  ),
                );
              }),
            ),

          // Language selector — always visible
          const SizedBox(width: 16),
          Theme(
            data: Theme.of(context).copyWith(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ),
            child: DropdownButton<String>(
              dropdownColor: Colors.white,
              value: widget.currentLocale,
              underline: const SizedBox.shrink(),
              iconEnabledColor: AppColors.primary,
              items: [
                DropdownMenuItem(
                  value: 'en',
                  child: SvgPicture.asset('assets/flags/gb.svg',
                      width: 24, height: 16),
                ),
                DropdownMenuItem(
                  value: 'fr',
                  child: SvgPicture.asset('assets/flags/fr.svg',
                      width: 24, height: 16),
                ),
                DropdownMenuItem(
                  value: 'de',
                  child: SvgPicture.asset('assets/flags/de.svg',
                      width: 24, height: 16),
                ),
              ],
              onChanged: (val) {
                if (val != null && widget.onLocaleChanged != null) {
                  widget.onLocaleChanged!(val);
                }
              },
            ),
          ),

          // "Get Started" CTA — always visible on desktop
          if (isDesktop) ...[
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () => widget.onItemSelected(4),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                elevation: 0,
                shadowColor: Colors.transparent,
              ),
              child: Text(
                AppLocalizations.of(context)!.contactUs,
                style:
                    GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ],
      ),
    );
  }
}