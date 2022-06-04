import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_gap/src/core/app_values/app_values.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;
  Animation<double>? textAnimation;

  @override
  void initState() {
    animationController =
        AnimationController(duration: const Duration(seconds: 4), vsync: this);
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      animation!.addListener(() async {
        if (animation!.isCompleted) {
          await Future.delayed(const Duration(seconds: 1));
          _goHome();
        }
      });
    });
    super.initState();
  }

  void _goHome() {
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    animation = Tween<double>(begin: -200.0, end: size.height / 3.8).animate(
        CurvedAnimation(parent: animationController!, curve: Curves.bounceOut));

    textAnimation = Tween<double>(begin: -200.0, end: size.height / 3.8)
        .animate(CurvedAnimation(
            parent: animationController!,
            curve: Curves.fastLinearToSlowEaseIn));

    animationController?.forward();
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: size.width / 2,
                  height: size.height / 2,
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: [
                      AnimatedBuilder(
                        animation: animation!,
                        builder: (context, child) {
                          return Positioned(
                            top: animation!.value,
                            child: child!,
                          );
                        },
                        child: Image.asset(
                          Assets.logo,
                          width: size.width / 2,
                          height: size.width / 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: size.width,
                height: size.height / 2,
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: textAnimation!,
                      builder: (context, child) {
                        return Positioned(
                          bottom: textAnimation!.value + 100.h,
                          child: child!,
                        );
                      },
                      child: Text(
                        "GithubGAP",
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
