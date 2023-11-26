import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riick_and_morty/presentation/theme/app_colors.dart';
import 'package:riick_and_morty/presentation/theme/app_fonts.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({
    super.key,
    required this.currentInxdex,
    required this.onTap,
  });
  final int currentInxdex;
  final Function(int) onTap;

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: widget.onTap,
      currentIndex: widget.currentInxdex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.navBarBgColor,
      selectedItemColor: AppColors.selectedItemColor,
      unselectedItemColor: AppColors.unselectedItemColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: AppFonts.s12w400g,
      unselectedLabelStyle: AppFonts.s12w400c,
      items: [
        BottomNavigationBarItem(
          backgroundColor: AppColors.navBarBgColor,
          icon: SvgPicture.asset('assets/svg/char.svg'),
          label: 'Персонажи',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/svg/locat.svg'),
          label: 'Локациии',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/svg/episode.svg'),
          label: 'Эпизоды',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/svg/set.svg'),
          label: 'Настройки',
        ),
      ],
    );
  }
}
