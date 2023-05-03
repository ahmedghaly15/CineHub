import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_styles.dart';

ThemeData appTheme() => ThemeData.dark().copyWith(
      appBarTheme: AppBarTheme(
        centerTitle: true,
        titleTextStyle: AppStyles.textStyle19.copyWith(
          fontWeight: FontWeight.w600,
        ),
        elevation: 0,
        backgroundColor: AppColors.kPrimaryColor,
      ),
      scaffoldBackgroundColor: AppColors.kPrimaryColor,
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
    );
