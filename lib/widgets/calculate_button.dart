import 'package:cakes_calculator/widgets/icon_svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../main_provider.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>
      (builder: (context, data, _){
      return GestureDetector(
        onTap: () => data.calculate(),
        child: Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: data.isDark ? kLight : kCreme,
                  blurRadius: 20,
                  spreadRadius: 5,
                  offset: const Offset(-6, -6)
              ),
              BoxShadow(
                  color: data.isDark ? kDark : kGrey,
                  blurRadius: 20,
                  spreadRadius: 5,
                  offset: const Offset(6, 6)
              ),
            ],
            border: Border.all(width: 2, color: data.isDark
                ? kBrown.withOpacity(0.7)
                : kBeige.withOpacity(0.5)),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                data.isDark ? kLight : kCreme,
                data.isDark ? kDark : kGrey,
              ],
            ),
          ),
          child: Center(
              child: IconSvg(icon: 'calculator',
                  color: data.isDark
                      ? kWhite.withOpacity(0.2)
                      : kBrown.withOpacity(0.2))),
        ),
      );
    });
  }
}