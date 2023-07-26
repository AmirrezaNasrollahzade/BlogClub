// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// ignore_for_file: deprecated_member_use

import 'package:blog_club/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:blog_club/article.dart';
import 'package:blog_club/gen/fonts.gen.dart';
import 'package:blog_club/home.dart';
import 'package:blog_club/profile.dart';

// flutter gen ->  flutter packages pub run build_runner build
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
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: primaryTextColor,
            titleSpacing: 16,
            elevation: 10,
          ),
          snackBarTheme: const SnackBarThemeData(
            behavior: SnackBarBehavior.fixed,
            elevation: 0,
            backgroundColor: primaryColor,
          ),
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
      home: const MainScreen(),
    );
  }
}

const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int menuIndex = 3;
const double bottomNavigationHeight = 65;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = homeIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
          bottom: bottomNavigationHeight,
          child: IndexedStack(
            index: selectedIndex,
            children: const [
              HomeScreen(),
              Article(),
              SearchScreen(),
              ProfileScreen(),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: BottomNavigation(
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            selectedIndex: selectedIndex,
          ),
        ),
      ],
    ));
  }
}

class BottomNavigation extends StatelessWidget {
  Function(int index) onTap;
  int selectedIndex;
  BottomNavigation({
    Key? key,
    required this.onTap,
    required this.selectedIndex,
  }) : super(key: key);

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
              height: bottomNavigationHeight,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: const Color(0xff988487).withOpacity(0.3),
                ),
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavigationItem(
                      onTap: () {
                        onTap(homeIndex);
                      },
                      isActive: selectedIndex == homeIndex,
                      imagePNG: 'Home.png',
                      activeIconFileName: 'Home.png',
                      title: 'Home'),
                  BottomNavigationItem(
                      isActive: selectedIndex == articleIndex,
                      onTap: () {
                        onTap(articleIndex);
                      },
                      imagePNG: 'Articles.png',
                      activeIconFileName: 'Articles.png',
                      title: 'Articles'),
                  Expanded(child: Container()),
                  BottomNavigationItem(
                      onTap: () {
                        onTap(searchIndex);
                      },
                      isActive: selectedIndex == searchIndex,
                      imagePNG: 'Search.png',
                      activeIconFileName: 'Search.png',
                      title: 'Search'),
                  BottomNavigationItem(
                      onTap: () {
                        onTap(menuIndex);
                      },
                      isActive: selectedIndex == menuIndex,
                      imagePNG: 'Menu.png',
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
  final String imagePNG;
  final String activeIconFileName;
  final String title;
  final Function() onTap;
  final bool isActive;
  const BottomNavigationItem(
      {super.key,
      required this.isActive,
      required this.onTap,
      required this.imagePNG,
      required this.activeIconFileName,
      required this.title});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/icons/$imagePNG'),
            const SizedBox(height: 4),
            Text(
              title,
              style: themeData.textTheme.caption!.copyWith(
                  color: isActive
                      ? themeData.colorScheme.primary
                      : themeData.textTheme.caption!.color),
            ),
          ],
        ),
      ),
    );
  }
}
