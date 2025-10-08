import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A wrapper function is used for changing the font style easily in the future
/// for example if we want to change the font from VT323 to another font
/// we just need to change it here not in the whole app
///
/// Usage:
/// ```dart
///   Text(
///      "Hello World",
///       style: fontWrapper(context, TextStyle(fontSize: 24))
///   );

fontWrapper(BuildContext context, TextStyle style) {
  return GoogleFonts.vt323().merge(style);
}
