part of 'import.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      context.push('/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft, // Start from top-left
            end: Alignment.bottomRight, // End at bottom-right
            colors: [
              Color(0xFF63B5AF), // Start color
              Color(0xFF438883), // End color
            ],
          ),
        ),
        child: Center(
          child: DefaultText(title: "MONO"), // Replace with your logo
        ),
      ),
    );
  }
}
