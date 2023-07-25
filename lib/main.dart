// ignore_for_file: deprecated_member_use

import 'package:blog_club/gen/fonts.gen.dart';
import 'package:blog_club/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    systemNavigationBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    const Color primaryTextColor = Color(0xff0D253C);
    const Color secondaryTextColor = Color(0xff2D4379);
    const Color primaryTextButtonColor = Color(0xff376AED);
    const Color primaryColor = Color(0xff376AED);
    return MaterialApp(
      title: 'Blog Club Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: primaryColor,
            onPrimary: Colors.white,
            onSurface: primaryTextColor,
            onBackground: primaryTextColor,
            background: Color(0xffFBFCFF),
          ),
          textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
              textStyle: MaterialStatePropertyAll(
                TextStyle(
                  color: primaryTextButtonColor,
                  fontFamily: FontFamily.avenir,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          textTheme: const TextTheme(
              caption: TextStyle(
                fontFamily: FontFamily.avenir,
                fontWeight: FontWeight.w700,
                color: Color(0xff788882),
                fontSize: 10,
              ),
              subtitle1: TextStyle(
                fontFamily: FontFamily.avenir,
                fontSize: 14,
                color: secondaryTextColor,
              ),
              headline5: TextStyle(
                fontWeight: FontWeight.w700,
                color: primaryTextColor,
                fontSize: 20,
                fontFamily: FontFamily.avenir,
              ),
              headline4: TextStyle(
                fontWeight: FontWeight.w700,
                color: primaryTextColor,
                fontSize: 24,
                fontFamily: FontFamily.avenir,
              ),
              headline6: TextStyle(
                fontFamily: FontFamily.avenir,
                fontWeight: FontWeight.bold,
                color: primaryTextColor,
              ),
              bodyText2: TextStyle(
                  color: secondaryTextColor,
                  fontFamily: FontFamily.avenir,
                  fontSize: 12))),
      home: const SplashScreen(),
      //  Stack(
      //   children: const [
      //     Positioned.fill(
      //       bottom: 65,
      //       child: HomeScreen(),
      //     ),
      //     Positioned(
      //       bottom: 0,
      //       left: 0,
      //       right: 0,
      //       child: BottomNavigation(),
      //     ),
      //   ],
      // ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          //white region BottomNavigation
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: const Color(0xff988487).withOpacity(0.3),
                ),
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  BottomNavigationItem(
                      iconFileName: CupertinoIcons.home,
                      activeIconFileName: 'Home.png',
                      title: 'Home'),
                  BottomNavigationItem(
                      iconFileName: CupertinoIcons.book,
                      activeIconFileName: 'Book.png',
                      title: 'Book'),
                  SizedBox(width: 30),
                  BottomNavigationItem(
                      iconFileName: CupertinoIcons.search,
                      activeIconFileName: 'Search.png',
                      title: 'Search'),
                  BottomNavigationItem(
                      iconFileName: CupertinoIcons.ellipsis_vertical,
                      activeIconFileName: 'Menu.png',
                      title: 'Menu'),
                ],
              ),
            ),
          ),
          //Plus Button BottomNavigation
          Center(
            child: Container(
              height: 65,
              width: 85,
              alignment: Alignment.topCenter,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: const Color(0xff376AED),
                    borderRadius: BorderRadius.circular(32.5),
                    border: Border.all(color: Colors.white, width: 4)),
                child: const Icon(
                  CupertinoIcons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final IconData iconFileName;
  final String activeIconFileName;
  final String title;

  const BottomNavigationItem(
      {super.key,
      required this.iconFileName,
      required this.activeIconFileName,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconFileName),
        const SizedBox(height: 4),
        Text(
          title,
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }
}
