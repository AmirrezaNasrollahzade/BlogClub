import 'package:blog_club/carousel/carousel_slider.dart';
import 'package:blog_club/data.dart';
import 'package:dotted_border/dotted_border.dart';
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
  static const defaultFontFamily = 'Avenir';
  @override
  Widget build(BuildContext context) {
    const Color primaryTextColor = Color(0xff0D253C);
    const Color secondaryTextColor = Color(0xff2D4379);
    const Color primaryTextButtonColor = Color(0xff376AED);
    return MaterialApp(
        title: 'Blog Club Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textButtonTheme: const TextButtonThemeData(
              style: ButtonStyle(
                textStyle: MaterialStatePropertyAll(
                  TextStyle(
                    color: primaryTextButtonColor,
                    fontFamily: defaultFontFamily,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            textTheme: const TextTheme(
                caption: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff788882),
                  fontSize: 10,
                ),
                subtitle1: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontSize: 14,
                  color: secondaryTextColor,
                ),
                headline5: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: primaryTextColor,
                  fontSize: 20,
                  fontFamily: defaultFontFamily,
                ),
                headline4: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: primaryTextColor,
                  fontSize: 24,
                  fontFamily: defaultFontFamily,
                ),
                headline6: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontWeight: FontWeight.bold,
                  color: primaryTextColor,
                ),
                bodyText2: TextStyle(
                    color: secondaryTextColor,
                    fontFamily: defaultFontFamily,
                    fontSize: 12))),
        home: Stack(
          children: const [
            Positioned.fill(
              child: HomeScreen(),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomNavigation(),
            ),
          ],
        ));
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final List<StoryData> stories = AppDatabase.stories;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hi,Amirreza!",
                    style: themeData.textTheme.subtitle1,
                  ),
                  Image.asset(
                    "assets/img/icons/notification.png",
                    height: 32,
                    width: 32,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 0, 24),
              child: Text(
                'Explore todays',
                style: themeData.textTheme.headline4,
              ),
            ),
            _StoryList(stories: stories),
            const SizedBox(height: 16),
            const _CategoryList(),
            _PostList(),
          ],
        ),
      )),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;
    return CarouselSlider.builder(
      itemCount: categories.length,
      itemBuilder: (context, index, realIndex) {
        return _CategoryItem(
          left: realIndex == 0 ? 15 : 8,
          right: realIndex == categories.length ? 15 : 8,
          category: categories[realIndex],
        );
      },
      options: CarouselOptions(
          scrollDirection: Axis.horizontal,
          viewportFraction: 0.8,
          aspectRatio: 1.2,
          initialPage: 0,
          disableCenter: true,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          scrollPhysics: const BouncingScrollPhysics(),
          enlargeStrategy: CenterPageEnlargeStrategy.height),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final Category category;
  final double right;
  final double left;

  const _CategoryItem(
      {super.key,
      required this.category,
      required this.left,
      required this.right});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, 0, right, 0),
      child: Stack(
        children: [
          Positioned.fill(
              top: 100,
              left: 56,
              right: 56,
              bottom: 24,
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(blurRadius: 20, color: Color(0xaa0D253C))
                  ],
                ),
              )),
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.fromLTRB(8, 0, 8, 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.blue,
              ),
              foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                        Color(0xaa0D253C),
                        Colors.transparent,
                      ])),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.asset(
                  'assets/img/posts/large/${category.imageFileName}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 45,
            left: 32,
            child: Text(
              category.title,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .apply(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    super.key,
    required this.stories,
  });

  final List<StoryData> stories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView.builder(
        itemCount: stories.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
        itemBuilder: (context, index) {
          final story = stories[index];
          return _Story(story: story);
        },
      ),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    super.key,
    required this.story,
  });

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 4, 4, 0),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed
                  ? _profileImageViewed(context)
                  : _profileImageNormal(),
              Positioned(
                height: 24,
                width: 24,
                bottom: 0,
                right: 0,
                child: Image.asset('assets/img/icons/${story.iconFileName}'),
              )
            ],
          ),
          const SizedBox(height: 8),
          Text(story.name),
        ],
      ),
    );
  }

  Widget _profileImageNormal() {
    return Container(
      height: 68,
      width: 68,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Color(0xff376AED),
              Color(0xff49B0E2),
              Color(0xff9CECFB),
            ],
          )),
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        padding: const EdgeInsets.all(5),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileImageViewed(BuildContext context) {
    return SizedBox(
      height: 68,
      width: 68,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        radius: const Radius.circular(24),
        color: const Color(0xff7B8BB2),
        dashPattern: const [8, 3],
        padding: const EdgeInsets.all(7),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: _profileImage(),
        ),
      ),
    );
  }

  Widget _profileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child: Image.asset('assets/img/stories/${story.imageFileName}'),
    );
  }
}

class _PostList extends StatelessWidget {
  final List<PostData> posts = AppDatabase.posts;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Latest News",
                style: Theme.of(context).textTheme.headline5,
              ),
              TextButton(
                onPressed: () {},
                style: Theme.of(context).textButtonTheme.style,
                child: const Text("More"),
              ),
            ],
          ),
        ),
        ListView.builder(
          itemExtent: 145, //height itemBuilder
          shrinkWrap: true, //height ListView.builder
          physics: const ClampingScrollPhysics(),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return Post(post: post);
          },
        )
      ],
    );
  }
}

class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.post,
  });

  final PostData post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(32, 8, 32, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Color(0x1a5282FF),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24), bottomLeft: Radius.circular(24)),
            child: Image.asset('assets/img/posts/small/${post.imageFileName}'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 16, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.caption,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    post.title,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        CupertinoIcons.hand_thumbsup,
                        size: 16,
                        color: Theme.of(context).textTheme.bodyText2!.color,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        post.likes,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        CupertinoIcons.clock,
                        size: 16,
                        color: Theme.of(context).textTheme.bodyText2!.color,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        post.time,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            post.isBookmarked
                                ? CupertinoIcons.bookmark_fill
                                : CupertinoIcons.bookmark,
                            size: 16,
                            color: Theme.of(context).textTheme.bodyText2!.color,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  border: Border.all(color: Colors.white,width: 4)
                ),
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
