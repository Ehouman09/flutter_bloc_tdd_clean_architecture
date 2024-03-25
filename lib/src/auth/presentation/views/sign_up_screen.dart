import 'package:educationapp/core/common/app/providers/user_provider.dart';
import 'package:educationapp/core/common/widgets/gradient_background.dart';
import 'package:educationapp/core/common/widgets/rounded_button.dart';
import 'package:educationapp/core/res/fonts.dart';
import 'package:educationapp/core/res/media_res.dart';
import 'package:educationapp/core/utils/core_utilis.dart';
import 'package:educationapp/src/auth/data/models/user_model.dart';
import 'package:educationapp/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:educationapp/src/auth/presentation/views/sign_in_screen.dart';
import 'package:educationapp/src/auth/presentation/widgets/sign_up_form.dart';
import 'package:educationapp/src/dashboard/presentation/views/dashboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {

  const SignUpScreen({super.key});

  static const routeName = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();


  final formKey = GlobalKey<FormState>();


  @override
  void dispose() {

    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (_, state){

          if(state is AuthError){

            CoreUtils.showSnackBar(context, state.message);

          } else if(state is SignedUp){

            context.read<AuthBloc>().add(
              SignInEvent(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
              ),
            );

          } else if(state is SignedIn){
            context.read<UserProvider>().initUser(state.user as LocalUserModel);
            Navigator.pushReplacementNamed(context, DashboardScreen.routeName);
          }
        },
        builder: (context, state){

          return GradientBackground(
            image: MediaRes.authGradientBackground,
            child: SafeArea(
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [

                    const Text(
                      'Easy to learn, discover more skills.',
                      style: TextStyle(
                        fontFamily: Fonts.aeonik,
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                      ),
                    ),

                    const SizedBox(height: 10,),

                    const Text(
                      'Sign up for an account',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 10,),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: (){
                          Navigator.pushReplacementNamed(
                            context,
                            SignInScreen.routeName,
                          );
                        },
                        child: const Text(
                          'Already have an account ?',
                        ),
                      ),
                    ),

                    const SizedBox(height: 10,),

                    SignUpForm(
                      emailController: emailController,
                      passwordController: passwordController,
                      fullNameController: fullNameController,
                      confirmPasswordController: confirmPasswordController,
                      formKey: formKey,
                    ),

                    const SizedBox(height: 30,),

                    if (state is AuthLoading) const Center(
                      child: CircularProgressIndicator(),
                    ) else RoundedButton(
                        label: 'Sign Up',
                        onPressed: (){
                          FocusManager.instance.primaryFocus?.unfocus();
                          FirebaseAuth.instance.currentUser?.reload();

                          if(formKey.currentState!.validate()){
                            context.read<AuthBloc>().add(
                              SignUpEvent(
                                name: fullNameController.text.trim(),
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              ),
                            );


                          }
                        }
                    )


                  ],
                ),
              ),
            ),
          );

        },
      ),
    );

  }
}
