import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_gap/generated/l10n.dart';
import 'package:github_gap/src/core/app_values/app_values.dart';
import 'package:github_gap/src/core/dependencies/dependencies.dart';
import 'package:github_gap/src/core/widgets/custom_loading.dart';
import 'package:github_gap/src/features/home/presentation/state/home_state.dart';
import 'package:github_gap/src/features/home/presentation/widgets/actions_home.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final status = ref.watch(homeProvider.select((value) => value.homeStatus));

    ref.listen<HomeState>(
      homeProvider,
      (prev, curr) {
        if (curr.homeStatus == HomeStatus.done) {
          context.go('/home/repos');
        }
      },
    );
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        image: const DecorationImage(
          opacity: 0.2,
          image: AssetImage(
            Assets.catProgrammer,
          ),
        ),
        color: Theme.of(context).primaryColor,
      ),
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              shadowColor: UIColors.secondaryColor,
              toolbarHeight: 70.h,
              centerTitle: true,
              title: Image.asset(
                Assets.catProgrammer,
                height: 60.h,
                width: 60.h,
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: LayoutBuilder(builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      children: [
                        Text(
                          S.of(context).findYourFavoritesRepo,
                          style: Theme.of(context).textTheme.headlineLarge,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 100.h),
                        const ActionsHome(),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          if (status == HomeStatus.loading) const CustomLoading(),
        ],
      ),
    );
  }
}
