part of 'import.dart';

class DefaultText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? size;
  final double? letterSpace;
  final double? wordSpace;
  final String? fontFamily;
  final TextAlign? align;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final int? maxLine;
  final bool? openDialog;
  TextStyle? style;

  DefaultText(
      {required this.title,
        this.color,
        this.style,
        this.size,
        this.align,
        this.fontFamily,
        this.decoration,
        this.letterSpace,
        this.wordSpace,
        this.overflow,
        this.fontWeight,
        this.maxLine,
        this.openDialog =false,});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle =style?? TextStyle(
        color: color ?? ThemeDataProvider.textLightThemeColor,
        fontSize: size ?? Style.normalFontSize(context),
        letterSpacing: letterSpace,
        wordSpacing: wordSpace,
        decoration: decoration ?? TextDecoration.none,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontFamily:
        fontFamily ?? fontFamily ?? GoogleFonts.poppins().fontFamily);

    // var lang = context.read<LangCubit>().state.locale.languageCode;

    return Text(
         title,
        textAlign: align ?? TextAlign.start,
        textScaleFactor: 1,
        maxLines: maxLine ?? 1,
        style: textStyle,
        overflow: overflow,
      );
  }
} //
