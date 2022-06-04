import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_gap/src/core/router/app_router.dart';
import 'package:github_gap/src/core/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(380, 820),
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'GithubGAP',
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        theme: materialTheme,
      ),
    );
  }
}
