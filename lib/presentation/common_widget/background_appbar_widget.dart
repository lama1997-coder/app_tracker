part of 'import.dart';

class BackgroundAppbarWidget extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? height;
  final Widget child;
  const BackgroundAppbarWidget({
    super.key,
    required this.child,
    this.borderRadius,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(16),
          color: ThemeDataProvider.mainAppColor,
          image: DecorationImage(
              image: AssetImage(Images.bg),
              fit: BoxFit.contain // Path to your image
              )),
      child: child,
    );
    Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(16),
          color: Color(0xFF172236),
        ),
        child: Container(
          //height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 5.0,
              ),
            ],
            borderRadius: borderRadius ?? BorderRadius.circular(16),
            gradient: const RadialGradient(
              colors: [
                Color.fromARGB(255, 44, 89, 143), // hsl(218, 41%, 35%)
                Color.fromARGB(255, 38, 76, 122), // hsl(218, 41%, 30%)
                Color.fromARGB(255, 24, 47, 75), // hsl(218, 41%, 20%)
                Color.fromARGB(255, 22, 43, 69), // hsl(218, 41%, 19%)
                Colors.transparent,
              ],
              stops: [0.15, 0.35, 0.75, 0.8, 1],
              radius: 0.65,
              center: Alignment.topLeft,
            ),
          ),
          padding: EdgeInsets.all(20),
          child: child,
        ));
  }
}
