import 'package:cakes_calculator/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            width: 50,
            height: 100,
            color: Colors.white,
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
              itemExtent: 30,
              children: List.generate(43, (index){
                return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text('${index + 8}')
                );
              } ),
            ),
          );
        });
  }
}