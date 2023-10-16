import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

ThemeData darkTheme= ThemeData(
  useMaterial3: true,
  cardColor: AppColors.primaryBlack,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
background: AppColors.defaultBlack,
primary: AppColors.primaryBlack,
secondary: AppColors.primaryBlack
  ),
    
);