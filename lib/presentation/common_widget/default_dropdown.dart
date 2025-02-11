part of 'import.dart';

class DefaultDropdownButtonFormField<T> extends StatelessWidget {
  final T? value;
  final String label;
  final List<T>? options;
  final Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final bool required;
  final Widget? icon;
  final Widget? prefixIcon;
  final String? hintText;

  const DefaultDropdownButtonFormField({
    super.key,
    required this.value,
    required this.label,
    required this.options,
    this.onChanged,
    this.validator,
    this.required = false,
    this.icon,
    this.prefixIcon,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: label,
        prefixIcon: prefixIcon,
        suffixIcon: icon,
        fillColor: Colors.transparent,
        filled: true,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        labelStyle: TextStyle(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: ThemeDataProvider.borderColor, // Customize the border color
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: ThemeDataProvider.backgroundDarkColor, // Customize focused border color
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: ThemeDataProvider.textWrongColor, // Customize error border color
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: ThemeDataProvider.textWrongColor, // Customize focused error border color
            width: 1,
          ),
        ),
      ),
      items: options?.map((option) {
        return DropdownMenuItem<T>(
          value: option,
          child: Text(option.toString()), // Display the option as a string
        );
      }).toList(),
      onChanged: onChanged,
      validator: validator ??
          (required
              ? (value) => value == null ? 'This field is required' : null
              : null),
    );
  }
}

