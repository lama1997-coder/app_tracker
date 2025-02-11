part of 'import.dart';


class MainWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const MainWidget({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding:padding?? PaddingConstants.screenPadding,
      child: child,
    );
  }
}
