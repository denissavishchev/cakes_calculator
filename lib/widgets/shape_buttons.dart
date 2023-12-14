import 'package:cakes_calculator/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import 'icon_svg.dart';

class ShapeButtons extends StatelessWidget {
  const ShapeButtons({
    super.key, this.top = true,
  });

  final bool top;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<MainProvider>(
        builder: (context, data, _){
          return SizedBox(
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(3, (index) {
                return GestureDetector(
                  onTap: () => data.selectButton(index, top),
                  child: Container(
                    width: 84,
                    height: 84,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                        boxShadow: [
                          BoxShadow(
                              color: data.isDark ? kLight : kCreme,
                              blurRadius: 20,
                              spreadRadius: 5,
                              offset: top
                                ? data.topSelectedButton == index
                                  ? const Offset(-3, -3) : const Offset(-6, -6)
                                : data.bottomSelectedButton == index
                                  ? const Offset(-3, -3) : const Offset(-6, -6)
                          ),
                          BoxShadow(
                              color: data.isDark ? kDark : kGrey,
                              blurRadius: 20,
                              spreadRadius: 5,
                              offset: top
                                  ? data.topSelectedButton == index
                                  ? const Offset(3, 3) : const Offset(6, 6)
                                  : data.bottomSelectedButton == index
                                  ? const Offset(3, 3) : const Offset(6, 6)
                          ),
                        ]
                    ),
                    child: top
                          ? data.topSelectedButton == index
                          ? IfContainer(index: index,)
                          : ElseContainer(index: index,)
                          : data.bottomSelectedButton == index
                          ? IfContainer(index: index,)
                          : ElseContainer(index: index,)
                  ),
                );
              }),
            ),
          );
        });
  }
}

class ElseContainer extends StatelessWidget {
  const ElseContainer({
    super.key, required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
        builder: (context, data, _){
          return Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0.5,
                    color: data.isDark
                        ? kBrown.withOpacity(0.7)
                        : kBeige.withOpacity(0.7)),
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
              child: IconSvg(
                icon: data.buttonImages[index],
                color: data.isDark ? kWhite.withOpacity(0.3) : kBrown.withOpacity(0.3),));
        });
  }
}

class IfContainer extends StatelessWidget {
  const IfContainer({
    super.key, required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
        builder: (context, data, _){
          return Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: data.isDark ? kDark : kGrey,
                    blurRadius: 1, spreadRadius: 0),
                BoxShadow(
                    color: data.isDark ? kLight : kCreme,
                    blurRadius: 2, spreadRadius: 5),
              ],
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: kBrown,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  data.isDark ? kDark : kGrey,
                  data.isDark ? kLight : kCreme,
                ],
              ),
            ),
            child: IconSvg(
              icon: data.buttonImages[index],
              color: data.isDark ? kWhite : kBrown,),
          );
        });
  }
}

