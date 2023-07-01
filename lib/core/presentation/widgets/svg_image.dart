import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImage extends StatelessWidget {
  const SvgImage({
    super.key,
    required this.assetName,
    required this.width,
    this.radius,
  });
  final String assetName;
  final double width;
  final Radius? radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(radius ?? Radius.zero),
      child: SvgPicture.asset(
        assetName,
        width: width,
        height: width,
        fit: BoxFit.cover,
      ),
    );
  }
}
