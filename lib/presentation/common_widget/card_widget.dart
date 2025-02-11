
part of 'import.dart';
class CardWidget extends StatefulWidget {
 final ImageProvider<Object>? image;
 final Widget? child;
 final double? width;
 final BoxBorder? boxBorder;
  const CardWidget({super.key, this.image, this.child, this.width, this.boxBorder});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
        width:widget.width?? MediaQuery.of(context).size.width /5,
      height: 300,
      padding: PaddingConstants.screenPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border:widget.boxBorder?? Border.all(color: ThemeDataProvider.borderColor.withAlpha(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.transparent, // #00000000 is transparent
            offset: Offset(0, 0), // No offset
            blurRadius: 4, // Blur radius of 4px
            spreadRadius: 4, // Spread radius of 4px
          ),
        ],
        // image: DecorationImage(
        //   image: widget.image??AssetImage(Images.logo),
        //   fit: BoxFit.cover,
        // ),
      ),
      child: widget.child??Container(),
    );
  }
}
