import 'package:flutter/material.dart';
import 'package:riick_and_morty/presentation/theme/app_colors.dart';
import 'package:riick_and_morty/presentation/theme/app_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onSearch,
    required this.hintText,
    required this.onFilter,
  });

  final TextEditingController controller;
  final String hintText;
  final Function() onSearch;
  final Function(String) onChanged;
  final Function() onFilter;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: AppFonts.s16w500w,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.navBarBgColor,
        prefixIcon: IconButton(
          padding: const EdgeInsets.only(
            left: 25,
            right: 15,
          ),
          onPressed: onSearch,
          icon: const Icon(
            Icons.search,
            color: AppColors.unselectedItemColor,
          ),
        ),
        hintText: hintText,
        hintStyle: AppFonts.s16w400,
        suffixIcon: IconButton(
          padding: const EdgeInsets.only(right: 15),
          onPressed: onFilter,
          icon: const Icon(
            Icons.filter_alt_outlined,
            color: AppColors.unselectedItemColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(),
        ),
      ),
    );
  }
}
