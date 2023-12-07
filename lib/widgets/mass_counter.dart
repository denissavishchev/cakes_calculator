import 'package:cakes_calculator/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MassCounter extends StatelessWidget {
  const MassCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,
        height: 98,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius:
          const BorderRadius.all(Radius.circular(30)),
          gradient: LinearGradient(
              colors: [
                const Color(0xffbebebc).withOpacity(0.5),
                const Color(0xff1a1a18).withOpacity(0.8),
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
            width: 58,
            height: 98,
            child: ListWheelScrollView(
              onSelectedItemChanged: (index) {
                FocusManager.instance.primaryFocus?.unfocus();
                data.setMass(index, order);
              },
              physics: const FixedExtentScrollPhysics(),
              itemExtent: 58,
              children: List.generate(10, (index){
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color(0xff91918f),
                      border:
                      Border.all(color: Colors.red, width: 0.5),
                      borderRadius: const BorderRadius.all(
                          Radius.circular(25)),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 3,
                            offset: Offset(0, 2)),
                        BoxShadow(
                            color: Color(0xff5e5e5c),
                            blurRadius: 1,
                            offset: Offset(0, -1)),
                      ]),
                  child: Center(child: Text('$index')),
                );
              } ),
            ),
          );
        });
  }
}
