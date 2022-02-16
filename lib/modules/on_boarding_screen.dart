import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travellers/components/components.dart';
import 'package:travellers/modules/login_screen.dart';
import 'package:travellers/modules/start_screen.dart';
import 'package:travellers/providers/theme_provider.dart';
import 'package:travellers/styles/colors.dart';

class BoardingModel {
  final String image;
  final String title;

  BoardingModel({
    required this.image,
    required this.title,
  });
}

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BoardingModel> Boarding = [
      BoardingModel(
          image: 'assets/images/firstPhoto.png',
          title: 'Welcome To Our App'),
      BoardingModel(
        image: 'assets/images/secPhoto.png',
        title: 'Book a Ride',
      ),
      BoardingModel(
        image: 'assets/images/thirdPhoto.png',
        title: 'Enjoy Travelling',
      ),
    ];
    bool isLast = false;
    var BoardController = PageController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Travellers',
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 7),
            child: TextButton(
              onPressed: () {
                NavigateAndFinish(
                  context,
                  StartScreen(),
                );
              },
              child: const Text(
                'SKIP',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) =>
                  buildBoardingItem(Boarding[index]),
              itemCount: Boarding.length,
              physics: BouncingScrollPhysics(),
              onPageChanged: (index) {
                if (index == Boarding.length - 1)
                  isLast = true;
                else
                  isLast = false;
              },
              controller: BoardController,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                SmoothPageIndicator(
                  controller: BoardController,
                  count: Boarding.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: defaultColor,
                    dotHeight: 10.0,
                    dotWidth: 10.0,
                    expansionFactor: 4.0,
                    activeDotColor: defaultColor,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      NavigateAndFinish(
                        context,
                        StartScreen(),
                      );
                    } else {
                      BoardController.nextPage(
                        duration: Duration(
                          milliseconds: 730,
                        ),
                        curve: Curves.easeInOutCubicEmphasized,
                      );
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        children: [
          Expanded(
              child: Image(
            image: AssetImage(model.image),
          )),
          SizedBox(
            height: 30.0,
          ),
          Text(
            model.title,
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ],
      );
}
