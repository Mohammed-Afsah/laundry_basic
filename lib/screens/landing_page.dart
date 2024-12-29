import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:laundry/landing/landing_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laundry/landing/landing_bloc.dart';
import 'package:laundry/landing/landing_event.dart';
import 'package:laundry/screens/LoginPage.dart';
import 'package:laundry/screens/home_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(body:
          BlocBuilder<LandingBloc, LandingState>(builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(top: 189.0),
          color: const Color(0xFFFFFFFF),
          child: Stack(
            children: [
              PageView(
                controller: pageController,
                onPageChanged: (index) {
                  state.page = index;
                  BlocProvider.of<LandingBloc>(context).add(LandingEvent());
                },
                children: [
                  _page(
                    1,
                    context,
                    'Next',
                    'Premium Laundry',
                    'Nam in risus quis risus consectetur pharetra vel vel erat. Suspendisse potenti. Maecenas sit amet semper orci. Etiam dictum lorem ac nisi.',
                    'assets/images/landing.png',
                  ),
                  _page(
                    2,
                    context,
                    'Next',
                    'Premium Laundry',
                    'Nam in risus quis risus consectetur pharetra vel vel erat. Suspendisse potenti. Maecenas sit amet semper orci. Etiam dictum lorem ac nisi.',
                    'assets/images/landing.png',
                  ),
                  _page(
                      3,
                      context,
                      'Get Started',
                      'Premium Laundry',
                      'Nam in risus quis risus consectetur pharetra vel vel erat. Suspendisse potenti. Maecenas sit amet semper orci. Etiam dictum lorem ac nisi.',
                      'assets/images/landing.png'),
                ],
              ),
              Positioned(
                  bottom: 400.0,
                  left: 180.0,
                  child: DotsIndicator(
                      position: state.page!.toDouble(),
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                          color: const Color(0xFFD9D9D9),
                          activeColor: const Color(0xFF0083F5),
                          size: const Size.square(8.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          activeSize: const Size(10.0, 8.0)))),
            ],
          ),
        );
      })),
    );
  }

  Widget _page(
    int index,
    BuildContext context,
    String buttonName,
    String title,
    String subTitle,
    String imagePath,
  ) {
    return Column(
      children: [
        SizedBox(
          width: 344.0,
          height: 218.0,
          child: Image(image: AssetImage(imagePath)),
        ),
        Container(
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF000000),
              fontSize: 18.0,
            ),
          ),
        ),
        const SizedBox(
          height: 2.0,
        ),
        Container(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Color(0xFF808080), fontSize: 13.0),
          ),
        ),
        const SizedBox(
          height: 300.0,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (index < 3) {
                    pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 650),
                        curve: Curves.decelerate);
                  } else {
                    Navigator.push(context,  MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),);
                  }
                },
                child: Container(
                  width: 308.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0083F5),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Center(
                    child: Text(
                      buttonName,
                      style: const TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: Color(0xFF0083F5), fontSize: 16.0),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
