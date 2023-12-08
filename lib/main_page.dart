import 'dart:ui';
import 'package:cakes_calculator/constants.dart';
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
    final data = Provider.of<MainProvider>(context, listen: false);
    data.getData();
    return Scaffold(
      body: Consumer<MainProvider>(
        builder: (context, data, _){
          return Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 10,),
                  Text('Cakes calculator',
                    style: TextStyle(
                        fontSize: 72,
                        color: kBrown,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Italian',
                        shadows: [
                          Shadow(
                            blurRadius: 30,
                            color: kWhite.withOpacity(0.6),
                            offset: const Offset(1, 1)
                          )
                        ]
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MassCounter(),
                      Text(data.setCoefficient(), style: TextStyle(color: kWhite),),
                      Text(data.result.toString(), style: TextStyle(color: kWhite),),
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
                  const SizedBox(height: 20,),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}




