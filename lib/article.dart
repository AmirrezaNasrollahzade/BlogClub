// ignore_for_file: deprecated_member_use
import 'package:flutter_svg/flutter_svg.dart';
import 'package:blog_club/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Article extends StatelessWidget {
  const Article({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      floatingActionButton: Container(
        height: 50,
        width: 90,
        decoration: BoxDecoration(
          color: themeData.colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: themeData.colorScheme.primary.withOpacity(0.5),
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            showSnackBar(context, 'Like button is clicked.');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.img.icons.thumbs),
              const SizedBox(width: 5),
              Text('2.1 K',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: themeData.colorScheme.onPrimary,
                  ))
            ],
          ),
        ),
      ),
      backgroundColor: themeData.colorScheme.surface,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                // pinned: true,
                // floating: true,
                title: Text(
                  'Article',
                  style: themeData.textTheme.subtitle2!.copyWith(fontSize: 18),
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz_rounded)),
                  const SizedBox(width: 16),
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                          child: Text(
                            'Four Things Every Woman Needs To Know',
                            style: themeData.textTheme.headline4,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Assets.img.stories.story5.image(
                                    height: 48,
                                    width: 48,
                                  )),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Richard Geravin',
                                      style: themeData.textTheme.subtitle1!
                                          .copyWith(fontSize: 14),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text('2m ago'),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  showSnackBar(context, 'share is clicked,');
                                },
                                icon: Icon(CupertinoIcons.share,
                                    color: themeData.colorScheme.primary),
                              ),
                              IconButton(
                                onPressed: () {
                                  showSnackBar(context, 'Bookmark is clicked,');
                                },
                                icon: Icon(
                                  CupertinoIcons.bookmark,
                                  color: themeData.colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                          child: Assets.img.background.singlePost.image(),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
                          child: Text(
                            'A man’s sexuality is never your mind responsibility.',
                            style: themeData.textTheme.headline6!
                                .copyWith(fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 32, 32),
                          child: Text(
                            'This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.',
                            style: themeData.textTheme.subtitle1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 116,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    themeData.colorScheme.surface,
                    themeData.colorScheme.surface.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
