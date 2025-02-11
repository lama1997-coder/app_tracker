part of 'import.dart';
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: PaddingConstants.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Image.asset(Images.onBoardingImage),
            DefaultText(title: "spend smarter save more",style: Theme.of(context).textTheme.headlineLarge,),
            DefaultButton(onTap: () {
              context.go("/register");
            },title  : "Get Started",)
            ,InkWell(
              onTap: () {
                context.go("/login");
              },
                child: DefaultText(title: "Already have account? Log In",style: Theme.of(context).textTheme.headlineSmall,))

          ],
        ),
      ),

    );
  }
}
