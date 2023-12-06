import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconSvg extends StatelessWidget {
  const IconSvg({
    super.key,
    this.padding = 8,
    required this.icon,
    required this.color,
  });

  final double padding;
  final String icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: SvgPicture.asset('assets/images/$icon.svg',
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn)
      ),
    );
  }
}