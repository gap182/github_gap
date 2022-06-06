import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:github_gap/src/core/app_values/app_values.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    Key? key,
    this.hintText,
    this.onChanged,
    this.action,
    this.iconAction,
    this.showAction = false,
    this.height,
    this.width,
  }) : super(key: key);

  final String? hintText;
  final Function(String v)? onChanged;
  final VoidCallback? action;
  final Widget? iconAction;
  final bool showAction;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
          depth: -2, color: UIColors.secondaryColor.withOpacity(0.5)),
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: SizedBox(
        height: height,
        width: width,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                style: Theme.of(context).textTheme.bodySmall,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                ),
                onChanged: onChanged,
              ),
            ),
            if (showAction)
              GestureDetector(
                onTap: action,
                child: iconAction,
              )
          ],
        ),
      ),
    );
  }
}
