import 'package:blog_club/data.dart';
import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  final items = AppDatabase.onBoardingItems;

  int page = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      if (_pageController.page!.round() != page) {
        setState(() {
          page = _pageController.page!.round();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Assets.img.background.onboarding.image(),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 32),
            height: 324,
            decoration: BoxDecoration(
              color: themeData.colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                    child: PageView.builder(
                  itemCount: items.length,
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[index].title,
                            style: themeData.textTheme.headline5,
                          ),
                          const SizedBox(height: 24),
                          Text(
                            items[index].description,
                            style: themeData.textTheme.subtitle1!
                                .apply(fontSizeFactor: 0.9),
                          ),
                        ],
                      ),
                    );
                  },
                )),
                Container(
                  padding: const EdgeInsets.only(left: 32, right: 32),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: items.length,
                        effect: ExpandingDotsEffect(
                          dotWidth: 8,
                          dotHeight: 8,
                          activeDotColor: themeData.primaryColor,
                          dotColor: themeData.primaryColor.withOpacity(0.1),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (page == items.length - 1) {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) {
                                  return const HomeScreen();
                                },
                              ));
                            } else {
                              _pageController.animateToPage(page + 1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.decelerate);
                            }
                          },
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            minimumSize: const MaterialStatePropertyAll(
                              Size(84, 64),
                            ),
                          ),
                          child: page == items.length - 1
                              ? const Icon(CupertinoIcons.check_mark)
                              : const Icon(CupertinoIcons.arrow_right))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
