import 'package:cakes_calculator/main_provider.dart';
import 'package:cakes_calculator/widgets/mass_counter.dart';
import 'package:cakes_calculator/widgets/shape_buttons.dart';
import 'package:cakes_calculator/widgets/size_scroll.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Consumer<MainProvider>(
          builder: (context, data, _){
            return Container(
              width: size.width,
              height: size.height,
              color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Cakes calculator',
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, fontFamily: 'Italian'),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MassCounter(),
                      Text(data.setCoefficient()),
                      Text(data.result.toString()),
                    ],
                  ),
                  ShapeButtons(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizeScroll(location: 'TL'),
                      Visibility(
                        visible: data.topSelectedButton == 2,
                          child: SizeScroll(location: 'TR')),
                    ],
                  ),
                  ShapeButtons(top: false),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizeScroll(location: 'BL'),
                      Visibility(
                        visible: data.bottomSelectedButton == 2,
                          child: SizeScroll(location: 'BR')),
                    ],
                  ),
                ],
              ),
            );
          },
        )
      ),
    );
  }
}




