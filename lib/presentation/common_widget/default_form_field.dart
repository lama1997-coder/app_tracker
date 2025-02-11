part of 'import.dart';

class DefaultForm extends StatelessWidget {
  final String? title;
  final String? hintText;

  final String? initialValue;
  final TextInputType? inputType;
  final bool? isPassword;
  final bool? readOnly;
  final Color? color;
  final int? maxLines;
  final bool? haveTitle;
  final TextEditingController? controller;
  final Widget? icon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String value)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final Function()? onTap;

  DefaultForm({
    this.title,
    this.inputType,
    this.isPassword,
    this.controller,
    this.validator,
    this.icon,
    this.haveTitle,
    this.onChange,
    this.inputFormatters,
    this.prefixIcon,
    this.onFieldSubmitted,
    this.readOnly,
    this.initialValue,
    this.color,
    this.maxLines, this.textInputAction, this.onTap, this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap??(){
        SystemChannels.textInput.invokeMethod('TextInput.show');

      },
      onFieldSubmitted: onFieldSubmitted,

      textInputAction:textInputAction?? TextInputAction.send,

      maxLines: maxLines ?? 1,
      readOnly: readOnly ?? false,
      controller: controller ?? TextEditingController(text: initialValue ?? ""),
      keyboardType: inputType ?? TextInputType.text,
      obscureText: isPassword ?? false,
        style:TextStyle(color: ThemeDataProvider.backgroundDarkColor),
      // decoration: InputDecoration(
      //   hintText: hintText,
      //   prefixIcon: prefixIcon
      // ),
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        fillColor: color ?? Colors.transparent,
        filled: true,
        isDense: true, // Ensure proper layout
        //    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        suffixIcon: icon,
        prefix: prefixIcon,
            labelText: title ?? "Hi",
        alignLabelWithHint: true,
        labelStyle: TextStyle(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: ThemeDataProvider.borderColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: ThemeDataProvider.backgroundDarkColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: ThemeDataProvider.textWrongColor,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: ThemeDataProvider.textWrongColor,
            width: 1,
          ),
        ),
     ),
      validator: validator ??
              (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter ' + (title ?? "value");
            }
          },
      onChanged: onChange,
    );
  }
}
