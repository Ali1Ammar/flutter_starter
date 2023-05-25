import 'dart:ui';

extension OnColor on Color {
  ColorFilter toColorFilter() {
    return ColorFilter.mode(this, BlendMode.srcIn);
  }
}
