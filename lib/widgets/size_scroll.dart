import 'package:cakes_calculator/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class SizeScroll extends StatelessWidget {
  const SizeScroll({
    super.key, required this.location,
  });

  final String location;

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
        builder: (context, data, _){
          return Container(
            width: 60,
            height: 60,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                gradient: LinearGradient(
                    colors: [
                      kDark.withOpacity(0.5),
                      kDark.withOpacity(0.8),

                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: const [0, 0.75])),
            child: ListWheelScrollView(
              controller: FixedExtentScrollController(
                  initialItem: location == 'TL' ? data.lt - 8
                      : location == 'TR' ? data.rt - 8
                      : location == 'BL' ? data.ld - 8
                      : data.rd - 8
              ),
              onSelectedItemChanged: (index) {
                FocusManager.instance.primaryFocus?.unfocus();
                data.sizeScroll(location, index + 8);
              },
              physics: const FixedExtentScrollPhysics(),
              itemExtent: 46,
              children: List.generate(43, (index){
                return Container(
                  width: 46,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: kLight.withOpacity(0.7)),
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
                        child: Text('${index + 8}',
                          style: const TextStyle(color: kWhite, fontSize: 20),))
                );
              } ),
            ),
          );
        });
  }
}