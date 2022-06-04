import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_gap/src/core/app_values/app_values.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.showIcon = false,
    this.height,
    this.width,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;
  final bool showIcon;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: NeumorphicButton(
        onPressed: onPressed,
        style: NeumorphicStyle(
          color: UIColors.auxiliaryColor.withOpacity(0.5),
          shadowLightColor: UIColors.secondaryColor,
          depth: 2.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            if (showIcon)
              const Icon(
                Icons.arrow_forward_ios,
                color: UIColors.secondaryColor,
              ),
          ],
        ),
      ),
    );
  }
}
