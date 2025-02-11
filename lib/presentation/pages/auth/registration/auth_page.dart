part of 'import.dart';

class AuthScreen extends StatelessWidget {
  final bool isLogin;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthScreen({Key? key, required this.isLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      body: BackgroundAppbarWidget(
        borderRadius: BorderRadius.zero,
        height: double.infinity,

        child: SingleChildScrollView(
          child: Padding(
            padding: PaddingConstants.screenPadding,
            child: Column(
              children: [
                LogoWidget(),
                const SizedBox(height: 20),
                Container(
                  padding: PaddingConstants.screenPadding,

                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if(state is AuthSuccess &&isLogin){
                        context.go("/home");
                      }
                      if(state is AuthSuccess && !isLogin){
                        context.go("/login");
                      }
                      if (state is AuthSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Success: ${state.user.email}")),
                        );
                      } else if (state is AuthFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Error: ${state.message}")),
                        );
                      }
                    },

                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return CircularProgressIndicator();
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          DefaultText(
                            title:isLogin?S.of(context).loginTitle: S.of(context).register_prompt,
                            size: Style.bigFontSize(context),
                            fontWeight: FontWeight.w600,
                            color: ThemeDataProvider.textLightGreyThemeColor,

                          ),
                          const SizedBox(height: 5),
                          DefaultText(
                            title:isLogin? S.of(context).loginSubtitle: S.of(context).register_greeting,
                            color: ThemeDataProvider.textLightGreyThemeColor,
                            size: 15,
                          ),
                          const SizedBox(height: 30),
                          DefaultForm(controller: emailController, title: S.of(context).email),
                          const SizedBox(height: 20),

                          DefaultForm(controller: passwordController, title: S.of(context).password),
                          SizedBox(height: 20),

                          DefaultButton(
                            onTap: () {
                              if (isLogin) {
                                context.read<AuthBloc>().add(
                                  AuthLoginEvent(emailController.text, passwordController.text),

                                );
                              } else {
                                context.read<AuthBloc>().add(
                                  AuthRegisterEvent(emailController.text, passwordController.text),
                                );
                              }
                            },
                            title:isLogin? "Login" : "Register",
                          ),

                          TextButton(
                            onPressed: () {
                             context.go(isLogin ? "/register" : "/login");
                            },
                            child: Text(isLogin ? "Don't have an account? Register" : "Already have an account? Login"),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
