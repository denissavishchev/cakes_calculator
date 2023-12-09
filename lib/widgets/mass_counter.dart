import 'package:cakes_calculator/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class MassCounter extends StatelessWidget {
  const MassCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 260,
        height: 70,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
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
          gradient: LinearGradient(
              colors: [
                kDark.withOpacity(0.5),
                kDark.withOpacity(0.8),

              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0, 0.75])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            return Mass(order: index,);
          }),
        )
    );
  }
}

class Mass extends StatelessWidget {
  const Mass({
    super.key,
    required this.order,
  });

  final int order;

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
        builder: (context, data, _){
          return SizedBox(
            width: 50,
            child: ListWheelScrollView(
              controller: FixedExtentScrollController(
                  initialItem: int.parse(
                      data.mass.toString().substring(order, order + 1)),
              ),
              onSelectedItemChanged: (index) {
                FocusManager.instance.primaryFocus?.unfocus();
                data.setMass(index, order);
              },
              physics: const FixedExtentScrollPhysics(),
              itemExtent: 50,
              children: List.generate(10, (index){
                return Container(
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
                  child: Center(child: Text('$index',
                      style: const TextStyle(color: kWhite, fontSize: 28))),
                );
              } ),
            ),
          );
        });
  }
}
