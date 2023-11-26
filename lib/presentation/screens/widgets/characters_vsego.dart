import 'package:flutter/material.dart';
import 'package:riick_and_morty/presentation/theme/app_colors.dart';
import 'package:riick_and_morty/presentation/theme/app_fonts.dart';

class CharactersTotalWidget extends StatelessWidget {
  const CharactersTotalWidget({
    super.key,
    required this.isList,
    required this.onPressed,
    required this.count,
  });

  final bool isList;
  final Function() onPressed;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Всего персонажей: $count'.toUpperCase(),
            style: AppFonts.s10w500c,
          ),
          isList
              ? IconButton(
                  onPressed: onPressed,
                  icon: Image.asset(
                    'assets/images/icon1.png',
                    height: 24,
                    color: AppColors.unselectedItemColor,
                  ),
                )
              : IconButton(
                  onPressed: onPressed,
                  icon: const Icon(
                    Icons.format_line_spacing_outlined,
                    size: 24,
                    color: AppColors.unselectedItemColor,
                  ),
                ),
        ],
      ),
    );
  }
}
