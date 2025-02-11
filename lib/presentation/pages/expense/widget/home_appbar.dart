part of 'import.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  final double totalIncome;
  final double totalExpense;

  const HomeAppbar({super.key, required this.totalIncome, required this.totalExpense});


  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(250), // Total height of the AppBar
      child: Stack(
        clipBehavior: Clip.none, // Allows the card to be positioned outside the app bar
        children: [
          // AppBar with oval shape
          CustomPaint(
            painter: OvalAppBarPainter(),
            child: BackgroundAppbarWidget(
              height: 200,
              // padding: EdgeInsets.only(top: 40, left: 16, right: 16),
              // alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DefaultText(
                   title: getGreeting(),
                    fontWeight: FontWeight.bold,
                  ),

                ],
              ),
            ),
          ),
          // Card positioned above the app bar's bottom curve
          Positioned(
            top: 200 - 100, // Adjusted to place the card correctly
            left: 16,
            right: 16,
            child: ExpenseCardWidget(
              totalIncome: totalIncome,
              totalExpense: totalExpense,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(250);
}

class OvalAppBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.fill;

    final path = Path()
      ..lineTo(0, size.height - 40)
      ..quadraticBezierTo(
        size.width / 2,
        size.height,
        size.width,
        size.height - 40,
      )
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

