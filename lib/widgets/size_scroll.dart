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
            width: 70,
            height: 70,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
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
                gradient: LinearGradient(
                    colors: [
                      data.isDark ? kDark.withOpacity(0.5) : kGrey.withOpacity(0.5),
                      data.isDark ? kDark.withOpacity(0.8) : kGrey.withOpacity(0.8),

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
                data.sizeScroll(location, index + 8);
              },
              physics: const FixedExtentScrollPhysics(),
              itemExtent: 50,
              children: List.generate(43, (index){
                return Container(
                  width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, 
                          color: data.isDark 
                              ? kLight.withOpacity(0.7)
                              : kCreme.withOpacity(0.7)),
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
                        child: Text('${index + 8}',
                          style: TextStyle(
                              color: data.isDark ? kWhite : kBrown, fontSize: 20),))
                );
              } ),
            ),
          );
        });
  }
}