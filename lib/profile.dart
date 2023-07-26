// ignore_for_file: deprecated_member_use

import 'package:blog_club/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'data.dart';
import 'home.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final posts = AppDatabase.posts;
    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                elevation: 0,
                backgroundColor:
                    themeData.colorScheme.background.withOpacity(0),
                title: const Text('Profile'),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.more_horiz_rounded),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(32, 0, 32, 64),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: themeData.colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: themeData.colorScheme.onBackground
                              .withOpacity(0.1),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Assets.img.stories.story4
                                    .image(height: 84, width: 84),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '@Samira',
                                      style: themeData.textTheme.headline4!
                                          .copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Samira Jahani',
                                      style: themeData.textTheme.subtitle2!
                                          .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Flutter Developer',
                                      style: themeData.textTheme.subtitle1!
                                          .copyWith(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: themeData
                                                  .colorScheme.primary),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 15, 10, 0),
                          child: Text(
                            'About me',
                            style: themeData.textTheme.headline4!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 5, 10, 10),
                          child: Text(
                            'I am a Flutter Developer and i love programming and i work with Mr.Amir. he is very smart and kind man. I love him.',
                            style: themeData.textTheme.subtitle1!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 36),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 32,
                      left: 96,
                      right: 96,
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 30,
                              color: themeData.colorScheme.onBackground
                                  .withOpacity(0.8)),
                        ]),
                      )),
                  Positioned(
                    bottom: 32,
                    left: 64,
                    right: 64,
                    child: Container(
                      height: 68,
                      decoration: BoxDecoration(
                          color: themeData.colorScheme.primary,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xff2151CD),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '52',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: themeData.colorScheme.onPrimary),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Post',
                                    style:
                                        themeData.textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.w200,
                                      color: themeData.colorScheme.onPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '250',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: themeData.colorScheme.onPrimary),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Following',
                                  style:
                                      themeData.textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.w200,
                                    color: themeData.colorScheme.onPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '4.5K',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: themeData.colorScheme.onPrimary),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Followers',
                                  style:
                                      themeData.textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.w200,
                                    color: themeData.colorScheme.onPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: themeData.colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'My Posts',
                              style: themeData.textTheme.headline6,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(Assets.img.icons.grid),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(Assets.img.icons.table),
                          ),
                        ],
                      ),
                    ),
                    for (var i = 0; i < posts.length; i++) Post(post: posts[i]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
