import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xFF001c95);

final textFlatButton = GoogleFonts.workSans().copyWith(
  color: Colors.white,
  fontWeight: FontWeight.w500,
  fontSize: 16,
  height: 16 / 16,
);

final textOutlinedButton = GoogleFonts.workSans().copyWith(
  color: const Color(0xFF001C95),
  fontWeight: FontWeight.w500,
  fontSize: 16,
  height: 16 / 16,
);

final textSubtitle = GoogleFonts.workSans().copyWith(
  color: primaryColor,
  fontWeight: FontWeight.w400,
  fontSize: 18,
  height: 27 / 18,
);

final textSubtitleSemibold = textSubtitle.copyWith(
  fontSize: 20,
  height: 24 / 20,
  fontWeight: FontWeight.w600,
);

final textHeadingSmall = GoogleFonts.rubik().copyWith(
  color: const Color(0XFF1E2A32),
  fontWeight: FontWeight.w500,
  fontSize: 20,
  height: 24 / 20,
);

final textLGHeadingSmall = GoogleFonts.rubik().copyWith(
  color: const Color(0XFF1E2A32),
  fontWeight: FontWeight.w500,
  fontSize: 24,
  height: 28.8 / 24,
);

final textParagraph = GoogleFonts.workSans().copyWith(
  color: const Color(0XFF708797),
  fontWeight: FontWeight.w400,
  fontSize: 14,
  height: 24 / 14,
);

final textParagraphBold = textParagraph.copyWith(
  fontWeight: FontWeight.w600,
);

final textDescription = GoogleFonts.workSans().copyWith(
  color: const Color(0XFF708797),
  fontWeight: FontWeight.w400,
  fontSize: 12,
  height: 18 / 12,
);
