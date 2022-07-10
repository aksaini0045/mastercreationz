import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  final List<Map<String, String>> _slideritems = [
    {
      'imagepath': 'assets/wallet.png',
      'heading': 'One\nWallet',
      'subheading': 'Using DigiPe Single Wallet You\nCan Do Wonders'
    },
    {
      'imagepath': 'assets/board.png',
      'heading': '35+\nServices',
      'subheading': 'DMT, AEPS, BBPS, Cards like\nmany services under one app'
    },
    {
      'imagepath': 'assets/graph.png',
      'heading': 'Best\nCommission',
      'subheading': 'We assure to give higest\ncommission & lowest charges'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(164, 227, 252, 1),
        body: Column(
          children: [Expanded(child: _upperpart()), _lowerpart()],
        ));
  }


  Widget _upperpart() {
    return SizedBox(
      child: Stack(
        children: <Widget>[
          const Positioned(
            top: -50,
            left: -50,
            child: (Image(
              height: 250,
              image: AssetImage("assets/corner1.png"),
            )),
          ),
          Center(
            child: SizedBox(
              height: 294,
              width: 278,
              child: Stack(children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  height: 284,
                  width: 268,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(
                            219,
                            245,
                            255,
                            1,
                          ),
                          width: 1),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                          bottomLeft: Radius.circular(130),
                          bottomRight: Radius.circular(130))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 27, right: 50, left: 50, bottom: 40),
                    child: CarouselSlider.builder(
                      carouselController: _carouselController,
                      itemCount: _slideritems.length,
                      itemBuilder: (context, index, pageindex) {
                        return Image.asset(
                          _slideritems[index]['imagepath']!,
                          fit: BoxFit.cover,
                        );
                      },
                      options: CarouselOptions(
                        scrollDirection: Axis.vertical,
                        autoPlayCurve: Curves.ease,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 4),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 450),
                        viewportFraction: 1,
                        initialPage: 0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Image.asset('assets/logo.png'),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
          const Positioned(
            right: 0,
            bottom: -70,
            child: (Image(
              height: 300,
              image: AssetImage("assets/corner2.png"),
            )),
          ),
        ],
      ),
    );
  }

  Widget _lowerpart() {
    return Container(
      height: 300,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(80))),
      child: Column(
        children: [
          Expanded(
            child: Container(
              // padding: EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      _slideritems[_currentIndex]['heading']!,
                      style: const TextStyle(
                          color: Color.fromRGBO(38, 50, 56, 1),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    _slideritems[_currentIndex]['subheading']!,
                    style: const TextStyle(
                        fontSize: 16, color: Color.fromRGBO(152, 150, 150, 1)),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromRGBO(117, 117, 117, 1)),
                  )),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: const Color.fromRGBO(228, 228, 228, 1)),
                    shape: BoxShape.circle),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(74, 195, 242, 1),
                        ),
                        shape: MaterialStateProperty.all(
                          const CircleBorder(
                            side: BorderSide.none,
                          ),
                        )),
                    onPressed: () {
                      _carouselController.nextPage();
                    },
                    child: const Icon(Icons.arrow_forward_sharp)),
              )
            ],
          )
        ],
      ),
    );
  }
}
