import 'package:cloudethix/constants.dart';
import 'package:cloudethix/pages/blog_page.dart';
import 'package:cloudethix/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'pages/about_us_page.dart';
import 'pages/contact_us_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    return GetMaterialApp.router(
      title: 'CloudEthix',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBgColor,
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: kPrimaryColor),
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: kBodyTextColor),
          bodyText2: TextStyle(color: kBodyTextColor),
          headline5: TextStyle(color: kDarkBlackColor),
        ),
      ),

      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return MyHomePage(title: "CloudEthix");
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return MyHomePage(title: "CloudEthix");
      },
    ),
    GoRoute(
      path: '/ContactUs',
      builder: (BuildContext context, GoRouterState state) {
        return const ContactUsPage();
      },
    ),
    GoRoute(
      path: '/AboutUs',
      builder: (BuildContext context, GoRouterState state) {
        return const AboutUsPage();
      },
    ),
    GoRoute(
      path: '/Blog',
      builder: (BuildContext context, GoRouterState state) {
        return const BlogPage();
      },
    ),
  ],
);
