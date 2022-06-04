import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_gap/generated/l10n.dart';
import 'package:github_gap/src/core/app_values/app_values.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        shadowColor: UIColors.secondaryColor,
        toolbarHeight: 70.h,
        title: Image.asset(
          Assets.catProgrammer,
          height: 60.h,
          width: 60.h,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            Assets.catProgrammer,
            color: Colors.white.withOpacity(0.2),
            colorBlendMode: BlendMode.modulate,
          ),
          Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                S.of(context).findYourFavoritesRepo,
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}
