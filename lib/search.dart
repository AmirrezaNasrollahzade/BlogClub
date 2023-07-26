

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Text(
          "Search Screen",
          style: themeData.textTheme.headline4,
        ),
      ),
    );
  }
}
