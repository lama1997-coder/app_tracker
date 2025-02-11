part of 'import.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget{
  final ImageProvider<Object>? image;
  final List<Widget>? children;
  const HeaderWidget({super.key, this.image, this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.9,
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: image ?? AssetImage(Images.logo),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.9, // Same height as the image
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0x0015182b)
                      .withValues(alpha: 0.3),
                  // Transparent at the top
                  const Color(0xFF000000), // Solid color at the bottom
                ],
                stops: [0.0, 1.0], // Transition from transparent to solid
              ),
            ),
          ),
          if (children != null) ...children! else SizedBox.shrink(),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(400);
}
