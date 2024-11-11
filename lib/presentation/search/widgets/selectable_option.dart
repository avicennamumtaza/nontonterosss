import 'package:flutter/material.dart';
import 'package:nontonterosss/core/configs/theme/app_colors.dart';

class SelectableOption extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  const SelectableOption({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.secondBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text(title)),
      ),
    );
  }
}
