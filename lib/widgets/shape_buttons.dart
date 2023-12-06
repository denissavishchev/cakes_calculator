import 'package:cakes_calculator/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
            width: size.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(3, (index) {
                return GestureDetector(
                  onTap: () => data.selectTopButton(index, top),
                  child: Container(
                    width: 100,
                    height: 100,
                    color: top
                        ? data.topSelectedButton == index ? Colors.red : Colors.blue
                        : data.bottomSelectedButton == index ? Colors.red : Colors.blue,
                    child: IconSvg(
                      icon: data.buttonImages[index],
                      color: top
                          ? data.topSelectedButton == index ? Colors.black : Colors.white
                          : data.bottomSelectedButton == index ? Colors.black : Colors.white,
                    ),
                  ),
                );
              }),
            ),
          );
        });
  }
}