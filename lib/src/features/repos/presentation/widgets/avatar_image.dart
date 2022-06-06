import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_gap/src/core/app_values/app_values.dart';
import 'package:github_gap/src/core/domain/entities/user_entity.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({
    Key? key,
    this.userInfoEntity,
  }) : super(key: key);

  final UserInfoEntity? userInfoEntity;

  @override
  Widget build(BuildContext context) {
    final avatarUrl = userInfoEntity?.avatarUrl;

    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          height: 150.h,
          width: 150.h,
          child: NeumorphicButton(
            style: NeumorphicStyle(
              boxShape: const NeumorphicBoxShape.circle(),
              shadowLightColor: UIColors.auxiliaryColor,
              color: Theme.of(context).colorScheme.secondary,
            ),
            padding: const EdgeInsets.all(5),
            child: ClipOval(
              child: avatarUrl != null
                  ? CachedNetworkImage(
                      imageUrl: avatarUrl,
                    )
                  : Image.asset(
                      Assets.logoWhite,
                    ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          userInfoEntity?.login ?? '',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: 10.h),
        Neumorphic(
          style: NeumorphicStyle(
            shadowLightColor: UIColors.auxiliaryColor,
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name: ${userInfoEntity?.name}",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: UIColors.primaryColor),
              ),
              SizedBox(height: 5.h),
              Text(
                "Email: ${userInfoEntity?.email}",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: UIColors.primaryColor),
              ),
              SizedBox(height: 5.h),
              Text(
                "Twitter: @${userInfoEntity?.twitterUsername}",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: UIColors.primaryColor),
              ),
              SizedBox(height: 5.h),
              Text(
                "Bio: @${userInfoEntity?.bio}",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: UIColors.primaryColor),
              ),
              SizedBox(height: 5.h),
              Text(
                "Publics Repositories: ${userInfoEntity?.publicRepos}",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: UIColors.primaryColor),
              ),
            ],
          ),
        )
      ],
    );
  }
}
