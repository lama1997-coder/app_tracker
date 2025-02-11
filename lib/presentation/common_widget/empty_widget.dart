part of 'import.dart';

class EmptyWidget extends StatefulWidget {
  final String? title;
  const EmptyWidget({super.key, this.title});

  @override
  _EmptyWidgetState createState() => _EmptyWidgetState();
}

class _EmptyWidgetState extends State<EmptyWidget>
    with SingleTickerProviderStateMixin {
  late GifController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GifController(vsync: this); // Provide the vsync
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Images.emptyIcon),
        const SizedBox(height: 5),
         DefaultText(title:widget.title?? "No Data ")

      ],
    );
  }
}
