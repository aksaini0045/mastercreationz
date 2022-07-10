import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mastercreationz/screens/sliderscreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).push(PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const SliderScreen(),
        transitionsBuilder: (context, animation1, animation2, child) =>
            SlideTransition(
          position:
              Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
                  .animate(animation1),
          child: child,
        ),
        transitionDuration: const Duration(milliseconds: 450),
        reverseTransitionDuration: const Duration(milliseconds: 450),
      ));
    });
   
    return Scaffold(
        body: Stack(
      children: [
        Transform(
          transform: Matrix4.skewY(-10),
          child: Container(
            decoration:
                const BoxDecoration(color: Color.fromRGBO(74, 194, 242, 1)),
            height: 500,
            width: double.infinity,
          ),
        ),
        _mainscreenwidget()
      ],
    ));
  }

  Widget _mainscreenwidget() {
    return Column(
      children: [
        Expanded(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/mainscreenlogo.png',
            ),
            Image.asset(
              'assets/mainscreen1.png',
            ),
          ],
        )),
        Column(
          children: [
            const Text('#digipayhaina',
                style: TextStyle(
                    fontSize: 18, color: Color.fromRGBO(74, 194, 242, 1))),
            const Text('Handcraft In India',
                style: TextStyle(
                    fontSize: 13, color: Color.fromRGBO(117, 117, 117, 1))),
            Image.asset(
              'assets/mainscreenflag.png',
              height: 19,
              width: 19,
            ),
            Image.asset('assets/mainscreenbaseimage.png'),
          ],
        ),
      ],
    );
  }
}
