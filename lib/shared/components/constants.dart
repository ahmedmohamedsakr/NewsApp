import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum KTabs {
  allNews,
  topTrending,
}

enum KDropDownItems {
  relevancy,
  popularity,
  publishedAt,
}

TextStyle smallText = GoogleFonts.montserrat(
  fontSize: 15.0,
);

TextStyle titleText = GoogleFonts.montserrat(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);
