// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use
import 'package:flutter/material.dart';

import 'package:blog_club/gen/assets.gen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int signTab = 1;
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textStyle = TextStyle(
      color: themeData.colorScheme.onPrimary,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Assets.img.icons.facebook.image(),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: themeData.colorScheme.primary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedTab = loginTab;
                                });
                              },
                              child: Text(
                                'Login'.toUpperCase(),
                                style: textStyle.copyWith(
                                    color: selectedTab == loginTab
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.5)),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedTab = signTab;
                                });
                              },
                              child: Text(
                                'Sing up'.toUpperCase(),
                                style: textStyle.copyWith(
                                    color: selectedTab == signTab
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.5)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: themeData.colorScheme.surface,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 32, right: 32, top: 16, bottom: 10),
                              child: selectedTab == loginTab
                                  ? Login(themeData: themeData)
                                  : SignUp(themeData: themeData),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  const Login({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back',
          style: themeData.textTheme.headline4,
        ),
        const SizedBox(height: 10),
        Text(
          'Sign in with your account',
          style: themeData.textTheme.subtitle1!.apply(fontSizeFactor: 0.9),
        ),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            label: Text('Username'),
          ),
        ),
        const PasswordTextField(),
        const SizedBox(height: 16),
        ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            minimumSize: MaterialStatePropertyAll(
              Size(MediaQuery.of(context).size.width, 60),
            ),
          ),
          onPressed: () {},
          child: Text('Login'.toUpperCase()),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Forgot your Password?'),
              TextButton(onPressed: null, child: Text('Reset Here'))
            ],
          ),
        ),
        const SizedBox(height: 10),
        Center(
            child: Text(
          'OR SIGN IN WITH',
          style: themeData.textTheme.subtitle1!.copyWith(letterSpacing: 2),
        )),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(height: 36, width: 36),
            const SizedBox(width: 16),
            Assets.img.icons.twitter.image(height: 36, width: 36),
          ],
        )
      ],
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome To Blog Club',
          style: themeData.textTheme.headline4,
        ),
        const SizedBox(height: 10),
        Text(
          'please enter your information',
          style: themeData.textTheme.subtitle1!.apply(fontSizeFactor: 0.9),
        ),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            label: Text('Full name'),
          ),
        ),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            label: Text('Username'),
          ),
        ),
        const PasswordTextField(),
        const SizedBox(height: 16),
        ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            minimumSize: MaterialStatePropertyAll(
              Size(MediaQuery.of(context).size.width, 60),
            ),
          ),
          onPressed: () {},
          child: Text('Sign Up'.toUpperCase()),
        ),
        const SizedBox(height: 10),
        Center(
            child: Text(
          'OR SIGN UP WITH',
          style: themeData.textTheme.subtitle1!.copyWith(letterSpacing: 2),
        )),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(height: 36, width: 36),
            const SizedBox(width: 16),
            Assets.img.icons.twitter.image(height: 36, width: 36),
          ],
        )
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      autocorrect: false,
      enableSuggestions: false,
      decoration: InputDecoration(
          suffix: InkWell(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Text(
              obscureText ? 'Show' : 'Hide',
              style: TextStyle(
                  fontSize: 12, color: Theme.of(context).colorScheme.primary),
            ),
          ),
          label: const Text('Password')),
    );
  }
}
