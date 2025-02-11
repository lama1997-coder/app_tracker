part of 'import.dart';

class LogoWidget extends StatelessWidget {
  final Color? color;
  const LogoWidget({super.key,this.color});

  @override
  Widget build(BuildContext context) {
    return DefaultText(
      title: "MONO",
      color:color?? ThemeDataProvider.primaryDarkThemeColor,
      fontWeight: FontWeight.w900,
      size: 30,

    );

  }
}
