import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

ThemeData lightTheme= ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
background: AppColors.defaultWhite,
primary: AppColors.white70,
secondary: AppColors.primaryWhite
  ),
    
);