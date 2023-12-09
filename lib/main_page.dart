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
    data.setCoefficient();
    data.calculate();
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
                  Container(
                    width: size.width * 0.9,
                    height: 38,
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          boxShadow: [
                            const BoxShadow(
                                color: kLight,
                                blurRadius: 20,
                                spreadRadius: 5,
                                offset: Offset(-6, -6)
                            ),
                            BoxShadow(
                                color: kDark.withOpacity(0.7),
                                blurRadius: 20,
                                spreadRadius: 5,
                                offset: const Offset(6, 6)
                            ),
                          ]
                      ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(width: 56,),
                        SizedBox(
                          width: 160,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Result:', style: TextStyle(color: kWhite.withOpacity(0.7),),),
                              const SizedBox(width: 5,),
                              Text(data.result,
                                style: const TextStyle(color: kWhite, fontSize: 28),),
                              const SizedBox(width: 5,),
                              Text('g', style: TextStyle(color: kWhite.withOpacity(0.7)),),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 56,
                            child: Text('(${data.coefficient})',
                              style: TextStyle(color: kWhite.withOpacity(0.3)),)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(width: 40,),
                      const MassCounter(),
                      SizedBox(
                        width: 40,
                          child: Align(
                            alignment: Alignment.centerLeft,
                              child: Text('g',
                                style: TextStyle(
                                    color: kWhite.withOpacity(0.7),
                                    fontSize: 24),)))
                    ],
                  ),
                  const SizedBox(height: 5,),
                  const ShapeButtons(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizeScroll(location: 'TL'),
                      Visibility(
                        visible: data.topSelectedButton == 2,
                          child: const SizeScroll(location: 'TR')),
                    ],
                  ),
                  const ShapeButtons(top: false),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizeScroll(location: 'BL'),
                      Visibility(
                        visible: data.bottomSelectedButton == 2,
                          child: const SizeScroll(location: 'BR')),
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




