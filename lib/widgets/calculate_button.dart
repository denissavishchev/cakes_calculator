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
            boxShadow: const [
              BoxShadow(
                  color: kLight,
                  blurRadius: 20,
                  spreadRadius: 5,
                  offset: Offset(-6, -6)
              ),
              BoxShadow(
                  color: kDark,
                  blurRadius: 20,
                  spreadRadius: 5,
                  offset: Offset(6, 6)
              ),
            ],
            border: Border.all(width: 2, color: kBrown.withOpacity(0.7)),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                kLight,
                kDark,
              ],
            ),
          ),
          child: Center(
              child: IconSvg(icon: 'calculator', color: kWhite.withOpacity(0.2))),
        ),
      );
    });
  }
}