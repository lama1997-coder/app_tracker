part of 'import.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;
  final double? width;
  final Widget? label;
  final Widget? icon;
  final double? height;
  final ButtonStyle? buttonStyle;

  final String? title;
  const DefaultButton(
      {super.key,
      required this.onTap,
      this.color,
      this.title,
      this.width,
      this.label,
      this.height,
      this.icon, this.buttonStyle});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      iconAlignment: IconAlignment.end,
      icon: icon ?? SizedBox.shrink(),
      onPressed: onTap ?? () {},
      style: buttonStyle,
      label: DefaultText(title: title??"",color: ThemeDataProvider.primaryDarkThemeColor,)??SizedBox.shrink()

    );
  }
}
