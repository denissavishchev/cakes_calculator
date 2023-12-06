import 'package:cakes_calculator/main_provider.dart';
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
                  ShapeButtons(),
                  Row(
                    children: [
                      SizeScroll(location: 'TL'),
                      SizeScroll(location: 'TR'),
                    ],
                  ),
                  ShapeButtons(top: false),
                  Row(
                    children: [
                      SizeScroll(location: 'BL'),
                      SizeScroll(location: 'BR'),
                    ],
                  ),
                  Text(data.setResult())
                ],
              ),
            );
          },
        )
      ),
    );
  }
}




