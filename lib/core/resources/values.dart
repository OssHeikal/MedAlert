import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPadding {
  static const double p2 = 2;
  static const double p4 = 4;
  static const double p6 = 6;
  static const double p8 = 8;
  static const double p14 = 14;
  static const double p16 = 16;
  static const double p20 = 20;

  static const EdgeInsets zero = EdgeInsets.zero;
  static const EdgeInsets small = EdgeInsets.all(8);
  static const EdgeInsets medium = EdgeInsets.all(16);
  static const EdgeInsets large = EdgeInsets.all(20);
  static const EdgeInsets xLarge = EdgeInsets.all(24);

  static const EdgeInsets smallH = EdgeInsets.symmetric(horizontal: 8);
  static const EdgeInsets mediumH = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets largeH = EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets xLargeH = EdgeInsets.symmetric(horizontal: 24);

  static const EdgeInsets smallV = EdgeInsets.symmetric(vertical: 8);
  static const EdgeInsets mediumV = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets largeV = EdgeInsets.symmetric(vertical: 20);
  static const EdgeInsets xLargeV = EdgeInsets.symmetric(vertical: 24);
}

class AppMargin {
  static const double m2 = 2;
  static const double m4 = 4;
  static const double m6 = 6;
  static const double m8 = 8;
  static const double m14 = 14;
  static const double m16 = 16;
  static const double m20 = 20;

  static EdgeInsetsGeometry zero = EdgeInsets.zero;
  static const EdgeInsets small = EdgeInsets.all(8);
  static const EdgeInsets medium = EdgeInsets.all(16);
  static const EdgeInsets large = EdgeInsets.all(20);
  static const EdgeInsets xLarge = EdgeInsets.all(24);

  static const EdgeInsets smallH = EdgeInsets.symmetric(horizontal: 8);
  static const EdgeInsets mediumH = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets largeH = EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets xLargeH = EdgeInsets.symmetric(horizontal: 24);

  static const EdgeInsets smallV = EdgeInsets.symmetric(vertical: 8);
  static const EdgeInsets mediumV = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets largeV = EdgeInsets.symmetric(vertical: 20);
  static const EdgeInsets xLargeV = EdgeInsets.symmetric(vertical: 24);
}

class AppHeight {
  static const double h0 = 0;
  static const double h1 = 1;
  static const double h2 = 2;
  static const double h4 = 4;
  static const double h6 = 6;
  static const double h8 = 8;
  static const double h10 = 10;
  static const double h12 = 12;
  static const double h16 = 16;
  static const double h20 = 20;
  static const double h24 = 24;
  static const double h32 = 32;
  static const double h40 = 40;
  static const double h48 = 48;
  static const double h50 = 50;
  static const double h54 = 54;
  static const double h60 = 60;
  static const double h64 = 64;
  static const double h72 = 72;
  static const double h80 = 80;
  static const double h100 = 100;
  static const double h120 = 120;
  static const double h130 = 130;
  static const double h150 = 150;
  static const double h200 = 200;
  static const double h220 = 220;
  static const double h250 = 250;
  static const double h300 = 300;

  static screenHeight() => ScreenUtil().screenHeight;
}

class AppWidth {
  static const double w0 = 0;
  static const double w1 = 1;
  static const double w2 = 2;
  static const double w4 = 4;
  static const double w6 = 6;
  static const double w8 = 8;
  static const double w10 = 10;
  static const double w12 = 12;
  static const double w16 = 16;
  static const double w20 = 20;
  static const double w24 = 24;
  static const double w32 = 32;
  static const double w40 = 40;
  static const double w48 = 48;
  static const double w52 = 52;
  static const double w64 = 64;
  static const double w72 = 72;
  static const double w80 = 80;
  static const double w100 = 100;
  static const double w120 = 120;
  static const double w126 = 126;
  static const double w150 = 150;
  static const double w200 = 200;
  static const double w220 = 220;
  static const double w250 = 250;
  static const double w300 = 300;

  static get screenWidth => ScreenUtil().screenWidth;
}

class AppSize {
  static const double s0 = 0;
  static const double s1 = 1;
  static const double s2 = 2;
  static const double s4 = 4;
  static const double s6 = 6;
  static const double s8 = 8;
  static const double s10 = 10;
  static const double s12 = 12;
  static const double s16 = 16;
  static const double s20 = 20;
  static const double s24 = 24;
  static const double s32 = 32;
  static const double s40 = 40;
  static const double s48 = 48;
  static const double s64 = 64;
  static const double s72 = 72;
  static const double s80 = 80;
  static const double s100 = 100;
  static const double s120 = 120;
  static const double s126 = 126;
  static const double s150 = 150;
  static const double s200 = 200;
  static const double s220 = 220;
  static const double s250 = 250;
  static const double s300 = 300;
}

class AppBorderRadius {
  static BorderRadius xSmall = BorderRadius.circular(8);
  static BorderRadius small = BorderRadius.circular(12);
  static BorderRadius medium = BorderRadius.circular(16);
  static BorderRadius large = BorderRadius.circular(24);
  static BorderRadius xLarge = BorderRadius.circular(32);
}

class AppRadius {
  static const Radius xSmall = Radius.circular(8);
  static const Radius small = Radius.circular(14);
  static const Radius medium = Radius.circular(16);
  static const Radius large = Radius.circular(24);
  static const Radius xLarge = Radius.circular(32);
}

class AppFontSize {
  static const double f8 = 8;
  static const double f10 = 10;
  static const double f12 = 12;
  static const double f13 = 13;
  static const double f14 = 14;
  static const double f15 = 15;
  static const double f16 = 16;
  static const double f18 = 18;
  static const double f20 = 20;
  static const double f24 = 24;
  static const double f32 = 32;
  static const double f48 = 48;
  static const double f64 = 64;
  static const double f72 = 72;
  static const double f80 = 80;
  static const double f100 = 100;
}
